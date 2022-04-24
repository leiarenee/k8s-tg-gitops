#!/usr/bin/env python
import os
import sys
import boto3
import json
import requests
import argparse
import configparser
from botocore.exceptions import ClientError


def get_credentials_for_role(role_arn, session_name):
    sts = boto3.client('sts')
    try:
        response = sts.assume_role(RoleArn=role_arn, 
                                   RoleSessionName=session_name)
        return response['Credentials']
    except ClientError as e:
        sys.stderr.write('ERROR: %s\n' % e.response['Error']['Message'])
        sys.exit(1)


def write_credentials(profile, credentials):
    filename = os.path.expanduser('~/.aws/credentials')
    dirname = os.path.dirname(filename)

    if not os.path.exists(dirname):
        os.makedirs(dirname)

    config = configparser.ConfigParser()
    config.read(filename)
    if not config.has_section(profile):
        config.add_section(profile)
    config.set(profile, 'aws_access_key_id', credentials['AccessKeyId'])
    config.set(profile, 'aws_secret_access_key', credentials['SecretAccessKey'])
    config.set(profile, 'aws_session_token', credentials['SessionToken'])
    with open(filename, 'w') as fp:
        config.write(fp)


def generate_console_link(credentials):
    session = json.dumps({'sessionId': credentials['AccessKeyId'],
                          'sessionKey': credentials['SecretAccessKey'],
                          'sessionToken': credentials['SessionToken']})

    r = requests.get("https://signin.aws.amazon.com/federation",
                     params={'Action': 'getSigninToken',
                             'SessionDuration': 43200,
                             'Session': session})
    signin_token = r.json()

    console = requests.Request('GET',
                              'https://signin.aws.amazon.com/federation',
                              params={'Action': 'login',
                                      'Issuer': 'Araido',
                                      'Destination': 'https://console.aws.amazon.com/',
                                      'SigninToken': signin_token['SigninToken']})
    prepared_link = console.prepare()
    return prepared_link.url


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='generate keys')
    parser.add_argument("--output", "-o", required=False,
                        dest="output", help="output format", metavar="STRING",
                        default="json", choices=['link', 'json', 'write'])
    parser.add_argument("--role-arn", "-r", required=True,
                        dest="role_arn", help="to assume", metavar="STRING")
    parser.add_argument("--session-name", "-s", required=True,
                        dest="session_name", help="to use", metavar="STRING")

    options = parser.parse_args()
    credentials = get_credentials_for_role(options.role_arn, 
                                           options.session_name)

    if options.output == 'link':
        print (generate_console_link(credentials))
    elif options.output == 'write':
        write_credentials(options.session_name, credentials)
    elif options.output == 'json':
        print(json.dumps({'AccessKeyId': credentials['AccessKeyId'],
                          'SecretAccessKey': credentials['SecretAccessKey'],
                          'SessionToken': credentials['SessionToken'],
                          'ConsoleMagicLink': generate_console_link(credentials)}))


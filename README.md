# K8s-TG-Gitops

Sample Repository for Creating a Kubernetes Cluster over a private VPC and replicating the infrastructure using Multi Branch Gitops approach by Terragrunt & Terraform.

## Documentation

* [What is Gitops?](https://www.gitops.tech/)
* [How it works?](./aws/docs/documentation.md)

## Pre-Requisites ##

* Terraform > v1.0
* Terragrunt > v31.0
* AWS Client > v2.0
* Jq

## Running ##

You should have an empty sub organizational account with a Route53 hosted zone created to test this code. 
Duplicate the [sample_override.hcl](./sample_override.hcl) file and rename it as `.override.hcl`
Enter the parameters in `override.hcl` file.  

Run:

```sh
./deploy.sh
```

<details>
<summary>Output</summary>

```sh
direnv: loading ~/Dev/Leia/k8s-tg-gitops/.envrc                                                                                                         
direnv: export +AWS_BATCH_ID +AWS_PAGER
leia@Leias-MBP k8s-tg-gitops % ./deploy.sh
/Users/leia/Dev/Leia/k8s-tg-gitops/aws/live
0ba60e3c3736ae1567b44d866fb2a51db9dd8142
Platform: darwin
Running 'apply' command in Environment:

testing
{
  "account_name": "testing",
  "aws_account_id": "57878****1",
  "aws_profile": "leia-testing", (Section title in your `./aws/credentials` file)
  "bucket_suffix": "",
  "parameters": { 
    "CERTIFICATE": "arn:aws:acm:eu-west-1:***68852***2943:certificate/43***1ea9***58-254b-4f8c-995f-a31**1559f**cce5", (Not compulsory)
    "CLUSTER": "my-testing-k8s", (required)
    "DNS_ZONE_ID": "Z0892705215W14M9I9W9N", 
    "DOMAIN": "test.leiarenee.io"
  }
}

AWS Caller Identity
arn:aws:iam::553**52****2943:user/cicd
AIDAY****B27X7****24ZTQXZ

Do you confirm? (y/n)
y
```

</details>

Enter `y`  

<details>
<summary>Output</summary>

Enter `y` again

```sh
Process 89238 Confirmed.
Processing aws/live/api/cluster
Parent PID:89238, Current PID:89264
Processing aws/live/api/deploymets/api/flask
Parent PID:89238, Current PID:89267
Processing aws/live/api/deploymets/services/api/flask/external
Parent PID:89238, Current PID:89272
Processing aws/live/api/deploymets/services/api/flask/internal
Parent PID:89238, Current PID:89275
Processing aws/live/api/deploymets/shared/namespace
Parent PID:89238, Current PID:89278
Processing aws/live/api/vpc
Parent PID:89238, Current PID:89290
INFO[0007] The stack at /Users/leia/Dev/Leia/k8s-tg-gitops/aws/live will be processed in the following order for command apply:
Group 1
- Module /Users/leia/Dev/Leia/k8s-tg-gitops/aws/live/api/build/flask
- Module /Users/leia/Dev/Leia/k8s-tg-gitops/aws/live/api/vpc

Group 2
- Module /Users/leia/Dev/Leia/k8s-tg-gitops/aws/live/api/cluster

Group 3
- Module /Users/leia/Dev/Leia/k8s-tg-gitops/aws/live/api/deploymets/shared/namespace

Group 4
- Module /Users/leia/Dev/Leia/k8s-tg-gitops/aws/live/api/deploymets/api/flask
- Module /Users/leia/Dev/Leia/k8s-tg-gitops/aws/live/api/deploymets/services/api/flask/external
- Module /Users/leia/Dev/Leia/k8s-tg-gitops/aws/live/api/deploymets/services/api/flask/internal
```

</details>


---


## Notes

To disable user interaction:
* Use `--terragrunt-non-interactive` with `deoploy.sh` command
* Set `$TG_DISABLE_CONFIRM` environment variable `true`

## Links
* Related Repositories:
  * [terraform-kubernetes-yaml](https://github.com/leiarenee/terraform-kubernetes-yaml)
  * [sample-api](https://github.com/leiarenee/smpl-api)
  * [aws-cloud-scripts](https://github.com/leiarenee/aws-cloud-scripts)
* [Old Version](https://github.com/leiarenee/tg-live)

## Dependencies
* [terraform-aws-codebuild](https://github.com/cloudposse/terraform-aws-codebuild)
* [terraform-aws-eks](https://github.com/terraform-aws-modules/terraform-aws-eks)
* [terraform-aws-vpc](https://github.com/terraform-aws-modules/terraform-aws-vpc)

---

## Credits

Leia Renée  
Senior Cloud Architect  
* email : [leiarenee20@gmail.com](mailto://leiarenee20@gmail.com)
* web : [renée.io](https://www.xn--rene-dpa.io/)  
* Github : [https://github.com/leiarenee](https://github.com/leiarenee)  
* Linkedin : [https://www.linkedin.com/in/leia-renee/](https://www.linkedin.com/in/leia-renee/)

## References

* [Presentations](https://drive.google.com/drive/folders/1ggK3hrvO2ryWi5Xx6-THTY4IVz3ENdSd)
* Articles
  * [Using Step-Functions to Orchestrate AWS Batch Jobs with Fargate](https://www.linkedin.com/pulse/using-step-functions-orchestrate-aws-batch-jobs-fargate-leia-ren%C3%A9e/)
* Repositories
  * [TG Live](https://github.com/leiarenee/tg-live)
  * [AWS Scripts](https://github.com/leiarenee/aws-cloud-scripts)
  * [TF K8s Yaml](https://github.com/leiarenee/terraform-kubernetes-yaml)

---

## Liability

THIS SOFTWARE ALONG WITH ITS DOCUMENTATION IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH IT.
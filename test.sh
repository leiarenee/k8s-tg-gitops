#!/bin/bash
set -e
HOST="flask-api.testing.leiarenee.io"
PORT=80
URL="http://$HOST:$PORT/api/replace"
DATA="The analysts of ABN did a great job!"
# Authorization user:pwd -> "replace:replace"

function fetch(){
    curl "$URL" \
    -X POST -d "{\"text\" : \"$DATA\"}" \
    -H "Content-Type: application/json" \
    -H "Authorization: Basic cmVwbGFjZTpyZXBsYWNl" \
    | jq .
}

echo
echo "Infrastructure test initialized."
echo
echo "TEST 1"
echo "Checking if the port is open by netcat"
test/health-check.sh 5 $HOST:$PORT
echo

echo "--------------------------------------"

echo
echo "TEST 2"
echo "Testing $URL by curl."
echo
echo "Sending "
echo "{"
echo "  \"test\" : \"$DATA\""
echo "}"
echo
echo "Result:"
fetch
echo
echo "--------------------------------------"

echo
echo "TEST 3"
DATA=$(cat test/files/test_input.txt)
echo "Sending "
echo "{"
echo "  \"test\" : \"$DATA\""
echo "}"
echo
echo "Result:"
fetch
echo
echo "Test Ended Succesfully."
echo

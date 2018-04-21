#! /bin/bash

set -e
set -u
set -o pipefail

DATE=$(date +"%Y%m%d%H%M%S")

source ~/passwords.sh

RETVAL=$(aws ecr get-login --no-include-email --region us-west-1)
eval "$RETVAL"

echo $CLIPPER_DOCKERHUB_PASSWORD | docker login --username="clipperjenkins" --password=$CLIPPER_DOCKERHUB_PASSWORD
bin/run_ci.sh 2>&1 | tee jenkins_$DATE.log

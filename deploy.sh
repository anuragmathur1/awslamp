#!/bin/bash
env=$1
cfn-flip "${env}-params.yml" "${env}-params.json"
aws cloudformation create-stack --stack-name "lamp-${env}" --template-body file://lamp.yml --region=ap-southeast-2 --capabilities CAPABILITY_IAM --parameters file://"${env}"-params.json --profile=personal

#!/bin/bash
env=$1

echo "Deploying ${env} environment "
params_file="${env}"-params.yml
if test -f "$params_file"; then
  echo "$params_file exist.. Continue"
  cfn-flip "${env}-params.yml" "${env}-params.json"
else
  echo "Parameters file for ${env} does not exist. Please create one and run again."
  exit 1
fi

stackname=$(aws cloudformation describe-stacks --region=ap-southeast-2 --profile=personal | jq '.Stacks[].StackName' | grep "lamp-${env}" )

if [ $? == 0 ]; then
  echo "stack exists.. need to be updated"
  echo "Updating $stackname ... "
  aws cloudformation update-stack --stack-name "lamp-${env}" --template-body file://lamp.yml --region=ap-southeast-2 --capabilities CAPABILITY_IAM --parameters file://"${env}"-params.json --profile=personal
  if [ $? == 0 ]; then
    echo "stack Update in progress. Please check the cloudformation console/cli for events and resources"
  else
    echo "Stack could not be updated"
  fi  
else
  echo "Stack DOES NOT exist. Creating"
  echo "Creating $stackname ... "
  aws cloudformation create-stack --stack-name "lamp-${env}" --template-body file://lamp.yml --region=ap-southeast-2 --capabilities CAPABILITY_IAM --parameters file://"${env}"-params.json --profile=personal
  if [ $? == 0 ]; then
    echo "stack creation in progress. Please check the cloudformation console/cli for events and resources"
  else
    echo "Stack could not be created"
  fi
fi

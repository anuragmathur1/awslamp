# awslamp

cfn-flip "dev-params.yml" "dev-params.json"
aws cloudformation create-stack --stack-name "lamp-stack" --template-body file://lamp.yml --parameters file://dev-params.json --region=ap-southeast-2 --capabilities CAPABILITY_IAM

# awslamp

## The repo is to create a lamp stack
## Resources Deployed :

1. VPC
2. Subnets ( Public and Private )
3. Route Tables
4. NACLs
5. Security Groups
6. Internet Gateway
7. IAM Instance Profile
8. ASG
9. RDS
10. ALB ( including Target group and Listener )
11. Internal R53 Hosted Zone
12. R53 record for the ALB and RDS

## How To ?
-> Run the script deploy.sh with an argument which is the env name
  Example : ./deploy.sh dev  OR ./deploy.sh prod

# There is a sample parameter file for prod and dev, which has parameters that can be changed.
# deploy.sh changes the params yml file to a json file
# The json file is then used with the create-stack and update-stack command for parameter inputs.

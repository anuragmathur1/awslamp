# awslamp

# URL : lamp.<public-hosted-zone-name>/phpinfo.php

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
  Example : 
  ##### $git clone https://github.com/anuragmathur1/awslamp.git
  ##### $cd awslamp
  ##### $./deploy.sh dev  __OR__ ./deploy.sh prod

### There is a sample parameter file for prod and dev, which has parameters that can be changed.
### deploy.sh changes the params yml file to a json file
### The json file is then used with the create-stack and update-stack command for parameter inputs.

## ToDo : 
1. Create an Alias for the lamp dns record
2. Tighten up the SGs
3. Tighten up NACLs
4. Least privilige for IAM instance profile
5. Divide the stack into multiple stacks.

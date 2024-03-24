Readme file for Webapp

This terraform configuration consists of networking and compute resources within their modules. Each one has been described in brief as follows:

VPC
VPC resource being created in an AWS region with 2 AZ architecture with dns hostnames and support enabled.

SUBNETS
There are 2 public subnets and 2 private subnets in this vpc.
Public subnets consists of the internet facing application load balancer whereas private subnets consists of the ec2 instance created in an autoscaling arrangement.

IGW & NATGW
To allow internet access, there is an internet gateway attached to the vpc.
2 NAT gateways are there in each availability zone to allow internet accessibility for instances to download the binaries and os updates.

ROUTE TABLES
There is a public route table which has a route to internet through internet gateway. This public route tables is associated to both the public subnets.
There are two private route tables consists of route to internet through each nat gateway in each AZ. These are associated to the two private subnets.

ALB
There is an application load balancer facing the internet. 
Only Specific ports have been allowed through the security group.
Load balancer has a listener rule configured on https. 
This listener is using a standard security policy.
Regarding the security certificate, as mentioned in the assessment, created a self signed certificate and imported to aws. That imported certificate arn is being used in the tfvars file.
Along with that target group is also operating on https port.

EC2 & ASG
There is a launch template which is launching the latest Amazon ami for the ec2 instance.
Additional storage has also been attached as encrypted in the template.
Ec2 instance will be using the ssm to connect. For this the iam instance role has been attached to the template.
Min, max and desired ec2 capacity has also been defined and these targets are behind the target group attached to the load balancer.
Upon manual deletion of any ec2, automatic scaling of ec2 instances are running as defined in asg.
User data has been encrypted using base64 which includes the commands to update the os.
Apache web server configuration has also been mentioned in this.
Along with that, the additional storage mount commands has also been added. Additional volume will be mounted to /var/log as describes in the assessment file.

ROUTE53
There is a route 53 private hosted zone created with the domain- example.com
Alb dns name has been added as a record for test.example.com in teh route 53 private hosted zone.

------------------------------------------------------------------------------------------------------------

All the modules have been called in the terraform configuration main.tf
backend.tf consists of the bucket where we can remotely save the terraform state file.
Variables.tf serves the purpose of declaring all the main variables.
provider.tf has the terraform version and the provider configuration block.
terraform.tfvars consists of the parameters that are required to create the resources.

-------------------------------------------------------------------------------------------------------------

Apart from this, there is a sample gitlab pipeline which can be utilized for this deployment

.gitlab-ci.yml file consists of a gitlab sample pipeline where the stages to run are defined for terraform configuration and apply.
AWS account id and role name are the variables defined in a bash script (assume-role.sh) which can be assumed by gitlab runners for deployment in the destination account.
In this way, the deployment will not be sticked to a specific account. Account id and role change can help deploying the same script into various aws accounts.

# IxLoad-on-AWS-1-App-1-Agent-1-VPC-1-Public-Subnet-1-Private-Subnet

## Description
This deployment creates a topology with a single virtual private cloud having a single public facing subnet and a single private subnet.

## Optional Variables
```
terraform.optional.auto.tfvars
```
You **MAY** uncomment one or more lines as needed in this file and replace values to match your particular environment.

## Required Usage
```
terraform init
terraform apply -auto-approve
terraform output SshKey
terraform destroy -auto-approve
```
You **MUST** output the SSH key pair associated with the AWS instances.  
Use the **private_key_pem** material to get Windows password for the App from the AWS Console.

## Optional Usage
```
terraform validate
terraform plan
terraform state list
terraform output
```
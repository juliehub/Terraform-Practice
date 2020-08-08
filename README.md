# Terraform-Practice
This repository contains practice intructions to manage AWS resources using Terraform.

### Step 1: Install Terraform

Follow the [installion guide](https://github.com/juliehub/Terraform-Practice/blob/master/terraform_installation.md) to install Terraform on Linux.

Optional: Install `Visual Studio Code` (install Terraform extension by HashiCorp for Syntax highlighting and autocompletion for Terraform) or `Sublime Text Editor`!

### Step 2: Getting Started
Follow the steps to create our first EC2 instance [example.md](https://github.com/juliehub/Terraform-Practice/blob/master/example.md).

### Step 3: Create Resource Dependencies
Assign an [Elastic IP](https://github.com/juliehub/Terraform-Practice/blob/master/example_elastic_ip.md) for EC2 instance.

### Step 4: Provision Infrastructure
Create an ssh key with no passphrase, upload to EC2 instance. Then, install, update, and start `nginx` on remote host. See the  [steps](https://github.com/juliehub/Terraform-Practice/blob/master/provision_ec2.md).

### Step 5: Input variables
Define region and AMI in `terraform.tfvars` file. See the [steps](https://github.com/juliehub/Terraform-Practice/blob/master/input_var_ec2.md).

### Step 6: Destroy Infrastructure
This command is the reverse of terraform apply in that it terminates all the resources specified by the configuration. 
It does not destroy resources running elsewhere that are not described in the current configuration.
```python
[ec2-user@ip-172-31-1-74 project1]$ terraform destroy
aws_instance.example: Refreshing state... [id=i-047ab115937a42e78]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy
  
...
aws_instance.example: Destruction complete after 30s

Destroy complete! Resources: 1 destroyed.
```

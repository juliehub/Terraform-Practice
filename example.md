[Documentation](https://learn.hashicorp.com/terraform/getting-started/build) 

### Setup AWS credentials in the file `~/.aws/credentials`
```python
[default]
aws_access_key_id = your_access_key_id
aws_secret_access_key = your_secret_access_key
```
### Configure AWS region in the file `~/.aws/config`
```python
[default]
region = your_aws_region
```
[More details on AWS configure](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html)

### Prepare [example.tf](https://github.com/juliehub/Terraform-Practice/blob/master/example.tf).
```python
$ mkdir -p /home/ec2-user/terraform-project/project1
$ vi example.tf
```
### Initialize terraform
```python
[ec2-user@ip-172-31-1-74 project1]$ terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "aws" (hashicorp/aws) 3.0.0...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 3.0"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
### Format and validate the configuration
1. Updates configurations in the current directory for easy readability and consistency
```python
[ec2-user@ip-172-31-1-74 project1]$ terraform fmt
```
2. Validate your configuration. If your configuration is valid, Terraform will return a success message.
```python
[ec2-user@ip-172-31-1-74 project1]$ terraform validate
Success! The configuration is valid.
```
### Create infrastructure
```python
[ec2-user@ip-172-31-1-74 project1]$ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.example will be created
  + resource "aws_instance" "example" {
      + ami                          = "ami-0a58e22c727337c51"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = (known after apply)
      + outpost_arn                  = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + secondary_private_ips        = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.
  Enter a value: 
```
Type yes at the confirmation prompt to proceed.
```python

  Enter a value: yes

aws_instance.example: Creating...
aws_instance.example: Still creating... [10s elapsed]
aws_instance.example: Still creating... [20s elapsed]
aws_instance.example: Still creating... [30s elapsed]
aws_instance.example: Creation complete after 31s [id=i-0adff03b788911557]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```
*** Inspect state
```python
[ec2-user@ip-172-31-1-74 project1]$ terraform show
# aws_instance.example:
resource "aws_instance" "example" {
    ami                          = "ami-0a58e22c727337c51"
    arn                          = "arn:aws:ec2:ap-southeast-2:941453813885:instance/i-0adff03b788911557"
    associate_public_ip_address  = true
    availability_zone            = "ap-southeast-2a"
    cpu_core_count               = 1
    cpu_threads_per_core         = 1
    disable_api_termination      = false
    ebs_optimized                = false
    get_password_data            = false
    hibernation                  = false
    id                           = "i-0adff03b788911557"
    instance_state               = "running"
    instance_type                = "t2.micro"
    ipv6_address_count           = 0
    ipv6_addresses               = []
    monitoring                   = false
    primary_network_interface_id = "eni-0d4d8c50b535d4f63"
    private_dns                  = "ip-172-31-47-147.ap-southeast-2.compute.internal"
    private_ip                   = "172.31.47.147"
    public_dns                   = "ec2-3-25-74-65.ap-southeast-2.compute.amazonaws.com"
    public_ip                    = "3.25.74.65"
    secondary_private_ips        = []
    security_groups              = [
        "default",
    ]
    source_dest_check            = true
    subnet_id                    = "subnet-5affe313"
    tenancy                      = "default"
    volume_tags                  = {}
    vpc_security_group_ids       = [
        "sg-6be29a1b",
    ]

    credit_specification {
        cpu_credits = "standard"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/xvda"
        encrypted             = false
        iops                  = 100
        volume_id             = "vol-0c81303b2c6bd0a7a"
        volume_size           = 8
        volume_type           = "gp2"
    }
}
```

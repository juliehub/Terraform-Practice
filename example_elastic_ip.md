#### Assigning an Elastic IP
Modify your `example.tf` and add the following to the end of the file.
```python
resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}
```
#### Apply Changes
Terraform will create two resources: the instance and the elastic IP. In the "instance" value for the "aws_eip", you can see the raw interpolation is still present. 
This is because this variable won't be known until the "aws_instance" is created. It will be replaced at apply-time.

```python
[ec2-user@ip-172-31-1-74 project1]$ terraform apply
aws_instance.example: Refreshing state... [id=i-0adff03b788911557]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_eip.ip will be created
  + resource "aws_eip" "ip" {
      + allocation_id     = (known after apply)
      + association_id    = (known after apply)
      + customer_owned_ip = (known after apply)
      + domain            = (known after apply)
      + id                = (known after apply)
      + instance          = "i-0adff03b788911557"
      + network_interface = (known after apply)
      + private_dns       = (known after apply)
      + private_ip        = (known after apply)
      + public_dns        = (known after apply)
      + public_ip         = (known after apply)
      + public_ipv4_pool  = (known after apply)
      + vpc               = true
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:

```

1) Create variable file [terraform.tfvars](https://github.com/juliehub/Terraform-Practice/blob/master/terraform.tfvars)
```python
[ec2-user@ip-172-31-1-74 project1]$ cat terraform.tfvars
region = "ap-southeast-2"

amis = {
  "ap-southeast-1" = "ami-0cd31be676780afa7"
  "ap-southeast-2" = "ami-0ded330691a314693"

}
```
2) Define new [example.tf](https://github.com/juliehub/Terraform-Practice/blob/master/example_input_var.tf)

3) Apply changes
```python
[ec2-user@ip-172-31-1-74 project1]$ terraform apply
aws_instance.example: Refreshing state... [id=i-0607f89f6a047b0d5]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.example will be created
  + resource "aws_instance" "example" {
      + ami                          = "ami-0ded330691a314693"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
....


aws_instance.example: Creation complete after 31s [id=i-047ab115937a42e78]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

ami = ami-0ded330691a314693
```
4) Display output
```python
[ec2-user@ip-172-31-1-74 project1]$ terraform output ami
ami-0ded330691a314693
[ec2-user@ip-172-31-1-74 project1]$
```

### local-exec Provisioner
To define a provisioner, modify the resource block defining the "example" EC2 instance to look like the following:
```python
resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}
```
Apply changes:
```python
[ec2-user@ip-172-31-1-74 project1]$ terraform apply
[ec2-user@ip-172-31-1-74 project1]$ cat ip_address.txt
52.62.250.119
```
### remote-exec Provisioner
`remote-exec` invokes a script on a remote resource after it is created. This can be used to run a configuration management tool, bootstrap into a cluster, etc

1) Create an ssh key with no passphrase with ssh-keygen -t rsa and use the name terraform.
```python
[ec2-user@ip-172-31-1-74 project1]$ ssh-keygen -t rsa -f ~/.ssh/terraform
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase):
```
2) Update the permissions of that key 
```python
[ec2-user@ip-172-31-1-74 project1]$ ls -l ~/.ssh/terraform*
```
3) Update the terraform file [example_provisioner.tf](https://github.com/juliehub/Terraform-Practice/blob/master/example_provisioner.tf)
remote-exec provisioner will run on the remote host to install, update, and start nginx
```python
[ec2-user@ip-172-31-1-74 project1]$ terraform apply
aws_eip.ip: Refreshing state... [id=eipalloc-015382676c6b2006f]
aws_instance.example: Refreshing state... [id=i-0a0355ac0b5b3cb2d]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create
  - destroy

Terraform will perform the following actions:

  # aws_eip.ip will be destroyed
  - resource "aws_eip" "ip" {
      - domain           = "vpc" -> null
      - id               = "eipalloc-015382676c6b2006f" -> null
      - private_dns      = "ip-172-31-5-239.ap-southeast-2.compute.internal" -> null
      - public_dns       = "ec2-52-64-1-237.ap-southeast-2.compute.amazonaws.com" -> null
      - public_ip        = "52.64.1.237" -> null
      - public_ipv4_pool = "amazon" -> null
      - tags             = {} -> null
      - vpc              = true -> null
    }

  # aws_instance.example will be created
  + resource "aws_instance" "example" {
      + ami                          = "ami-0a58e22c727337c51"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
```

#### local-exec Provisioner
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
Update the permissions of that key 
```python
[ec2-user@ip-172-31-1-74 project1]$ ls -l ~/.ssh/terraform*
```

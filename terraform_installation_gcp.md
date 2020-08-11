1. Download terraform 
```python
@terraform-ins1:~/.ssh$ wget https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip
--2020-08-11 04:01:56--  https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip
Resolving releases.hashicorp.com (releases.hashicorp.com)... 151.101.1.183, 151.101.65.183, 151.101.129.183, ...
Connecting to releases.hashicorp.com (releases.hashicorp.com)|151.101.1.183|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 34851622 (33M) [application/zip]
Saving to: ‘terraform_0.13.0_linux_amd64.zip’

terraform_0.13.0_linux_amd64 100%[=============================================>]  33.24M   158MB/s    in 0.2s    

2020-08-11 04:01:56 (158 MB/s) - ‘terraform_0.13.0_linux_amd64.zip’ saved [34851622/34851622]
```
2. Download `unzip` package (if needed)
```python
@terraform-ins1:~/.ssh$ sudo apt install unzip
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Suggested packages:
  zip
The following NEW packages will be installed:
  unzip
 ```
3. Unzip terraform
```python
@terraform-ins1:~/.ssh$ unzip terraform_0.13.0_linux_amd64.zip 
Archive:  terraform_0.13.0_linux_amd64.zip
  inflating: terraform               
```

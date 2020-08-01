### Installation Instructions on Linux
The below section contains instructions on how to install terraform on Linux

1. Download the pre-compiled binary for Linux from https://www.terraform.io/downloads.html
```python
[ec2-user@ip-172-31-1-74 ~]$ wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
--2020-08-01 12:18:26--  https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
Resolving releases.hashicorp.com (releases.hashicorp.com)... 151.101.29.183, 2a04:4e42:7::439
Connecting to releases.hashicorp.com (releases.hashicorp.com)|151.101.29.183|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 28424050 (27M) [application/zip]
Saving to: ‘terraform_0.12.29_linux_amd64.zip’

100%[===============================================================================================>] 28,424,050   102MB/s   in 0.3s

2020-08-01 12:18:27 (102 MB/s) - ‘terraform_0.12.29_linux_amd64.zip’ saved [28424050/28424050]
```
2. Unzip the package and move it to `/usr/local/bin` folder
```python
[ec2-user@ip-172-31-1-74 ~]$ unzip terraform_0.12.29_linux_amd64.zip
Archive:  terraform_0.12.29_linux_amd64.zip
  inflating: terraform
[ec2-user@ip-172-31-1-74 downloads]$ sudo mv terraform /usr/local/bin/
```
3. Verify the installation
Verify that the installation worked by opening a new terminal session and listing Terraform's available subcommands.
```python
[ec2-user@ip-172-31-1-74 ~]$ terraform --version
Terraform v0.12.29
[ec2-user@ip-172-31-1-74 ~]$ terraform -help
Usage: terraform [-version] [-help] <command> [args]
```
Add any subcommand to terraform -help to learn more about what it does and available options
```pyhon
[ec2-user@ip-172-31-1-74 ~]$ terraform -help plan
Usage: terraform plan [options] [DIR]

  Generates an execution plan for Terraform.

  This execution plan can be reviewed prior to running apply to get a
  sense for what Terraform will do. Optionally, the plan can be saved to
  a Terraform plan file, and apply can take this plan file to execute
  this plan exactly.

Options:

  -compact-warnings   If Terraform produces any warnings that are not
                      accompanied by errors, show them in a more compact form
                      that includes only the summary messages.

  -destroy            If set, a plan will be generated to destroy all resources
                      managed by the given configuration and state.
```
4. Enable tab completion
If you use either bash or zsh you can enable tab completion for Terraform commands. To enable autocomplete, run the following command and then restart your shell.
```python
[ec2-user@ip-172-31-1-74 ~]$ terraform -install-autocomplete
```

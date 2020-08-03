1. Setup AWS credentials in the file `~/.aws/credentials`
```python
[default]
aws_access_key_id = your_access_key_id
aws_secret_access_key = your_secret_access_key
```
2. Configure AWS region in the file `~/.aws/config`
```python
[default]
region = your_aws_region
```
[More details on AWS configure](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html)

3. Prepare [example.tf](https://github.com/juliehub/Terraform-Practice/blob/master/example.tf).
```python
$ mkdir -p /home/ec2-user/terraform-project/project1
$ vi example.tf
```
4. Initialize terraform
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

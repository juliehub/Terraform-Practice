# Terraform-Practice
This repository contains practice intructions to manage AWS resources using Terraform.

### Step 1: Install Terraform

Follow the [installion guide](https://github.com/juliehub/Terraform-Practice/blob/master/terraform_installation.md) to install Terraform on Linux.

Optional: Install Visual Studio Code (install Terraform extension by HashiCorp for Syntax highlighting and autocompletion for Terraform) or Sublime Text Editor!

### Step 2: Getting Started

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

3. Follow the [documentation](https://learn.hashicorp.com/terraform/getting-started/build) to practice our first [example](https://github.com/juliehub/Terraform-Practice/blob/master/example.tf).

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

```

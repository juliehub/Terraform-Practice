#### 1. Setting up GCP
- Create a [GCP Project](https://console.cloud.google.com/projectcreate)
- [Enable Google Compute Engine](https://console.developers.google.com/apis/library/compute.googleapis.com) for your project.
- Create a GCP [service account key](https://console.cloud.google.com/apis/credentials/serviceaccountkey) For the Role, choose "Project -> Editor".
#### 2. Configuration
Prepare terraform configuration [file](https://github.com/juliehub/Terraform-Practice/blob/master/main_gcp.tf)
#### 3. Initialize
```python
@terraform-ins1:~/terraform-docker-demo$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/google versions matching "3.5.0"...
- Installing hashicorp/google v3.5.0...
- Installed hashicorp/google v3.5.0 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
#### 4. Create resource
```python
terraform-ins1:~/terraform-docker-demo$ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_compute_network.vpc_network will be created
  + resource "google_compute_network" "vpc_network" {
      + auto_create_subnetworks         = true
      + delete_default_routes_on_create = false
      + gateway_ipv4                    = (known after apply)
      + id                              = (known after apply)
      + ipv4_range                      = (known after apply)
      + name                            = "terraform-network"
      + project                         = (known after apply)
      + routing_mode                    = (known after apply)
      + self_link                       = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

google_compute_network.vpc_network: Creating...
google_compute_network.vpc_network: Still creating... [10s elapsed]
google_compute_network.vpc_network: Still creating... [20s elapsed]
google_compute_network.vpc_network: Still creating... [30s elapsed]
google_compute_network.vpc_network: Still creating... [40s elapsed]
google_compute_network.vpc_network: Creation complete after 49s [id=projects/indigo-winter-286100/global/networks/terraform-network]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

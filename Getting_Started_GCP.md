#### Prerequisites:
Create a [Google Cloud Platform account](https://console.cloud.google.com/freetrial/) and configure Billing Alert.

#### 1. Installation:
Create a compute VM instance running on Linux.
Follow installation [steps](https://github.com/juliehub/Terraform-Practice/blob/master/terraform_installation_gcp.md)

#### 2. Build Infrastructure:
Create a [simple intrastructure](https://github.com/juliehub/Terraform-Practice/blob/master/build_infra_gcp.md)

#### 3. Change Infrastructure:
Add a new compute instance. See the [steps](https://github.com/juliehub/Terraform-Practice/blob/master/change_gcp.md)

#### 4. Create resource dependencies
Create static IP and assign to new compute instance. [See the steps](https://github.com/juliehub/Terraform-Practice/blob/master/gcp_resource_dependencies.md)

#### 5. Clean up
```python
@terraform-ins1:~/terraform-docker-demo$ terraform destroy
google_compute_network.vpc_network: Refreshing state... [id=projects/indigo-winter-286100/global/networks/terraform-network]
google_compute_instance.vm_instance: Refreshing state... [id=projects/indigo-winter-286100/zones/australia-southeast1-b/instances/terraform-instance]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # google_compute_instance.vm_instance will be destroyed
  - resource "google_compute_instance" "vm_instance" {
      - can_ip_forward       = false -> null
    
google_compute_network.vpc_network: Destruction complete after 49s

Destroy complete! Resources: 2 destroyed.
```

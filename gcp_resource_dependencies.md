1. Create new configuration [file.](https://github.com/juliehub/Terraform-Practice/blob/master/gcp_resource_dependencies.tf)

2. Plan changes
```python
          + subnetwork_project = (known after apply)
          + access_config {
              + nat_ip       = (known after apply)
              + network_tier = (known after apply)
            }
        }
      + scheduling {
          + automatic_restart   = (known after apply)
          + on_host_maintenance = (known after apply)
          + preemptible         = (known after apply)
          + node_affinities {
              + key      = (known after apply)
              + operator = (known after apply)
              + values   = (known after apply)
            }
        }
    }
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
Plan: 2 to add, 0 to change, 0 to destroy.
------------------------------------------------------------------------
Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

3. Apply changes
```python
@terraform-ins1:~/terraform-docker-demo$ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_compute_instance.vm_instance will be created
  + resource "google_compute_instance" "vm_instance" {
      + can_ip_forward       = false
      
google_compute_network.vpc_network: Creation complete after 50s [id=projects/indigo-winter-286100/global/networks/terraform-network]
google_compute_instance.vm_instance: Creating...
google_compute_instance.vm_instance: Still creating... [10s elapsed]
google_compute_instance.vm_instance: Creation complete after 12s [id=projects/indigo-winter-286100/zones/australia-southeast1-b/instances/terraform-instance]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

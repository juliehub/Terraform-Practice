1. Download terraform 
```python
@terraform-ins1:~$ wget https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip
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
@terraform-ins1:~$ sudo apt install unzip
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
@terraform-ins1:~$ unzip terraform_0.13.0_linux_amd64.zip 
Archive:  terraform_0.13.0_linux_amd64.zip
  inflating: terraform               
```
4. Move the Terraform binary
```python
@terraform-ins1:~$ sudo mv terraform /usr/local/bin/
```
5. Verify installation
```python
terraform-ins1:~$ terraform --version
Terraform v0.13.0
```
6. Enable tab completion
```python
@terraform-ins1:~$ terraform --install-autocomplete
```
7. Install Docker on Debian
```python
@terraform-ins1:~$ sudo apt update
...
@terraform-ins1:~$ sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg2
Reading package lists... Done
Building dependency tree       
Reading state information... Done
ca-certificates is already the newest version (20200601~deb9u1).
curl is already the newest version (7.52.1-5+deb9u11).
```
Import the repository’s GPG key using the following curl command :
```python
@terraform-ins1:~$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
OK
```
Add the stable Docker APT repository to your system’s software repository list:
```python
@terraform-ins1:~$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
```
Update the apt package list and install the latest version of Docker CE (Community Edition):
```python
@terraform-ins1:~$ sudo apt update
Hit:1 http://security.debian.org stretch/updates InRelease
Ign:2 http://deb.debian.org/debian stretch InRelease
Hit:3 http://deb.debian.org/debian stretch-updates InRelease
Hit:4 http://deb.debian.org/debian stretch-backports InRelease
Hit:5 http://deb.debian.org/debian stretch Release
Get:6 https://download.docker.com/linux/debian stretch InRelease [44.8 kB]
Hit:7 http://packages.cloud.google.com/apt cloud-sdk-stretch InRelease                                   
Hit:8 http://packages.cloud.google.com/apt google-compute-engine-stretch-stable InRelease
Get:10 https://download.docker.com/linux/debian stretch/stable amd64 Packages [14.4 kB]
Hit:11 http://packages.cloud.google.com/apt google-cloud-packages-archive-keyring-stretch InRelease
Fetched 59.2 kB in 0s (81.1 kB/s)                  
Reading package lists... Done
Building dependency tree       
Reading state information... Done
3 packages can be upgraded. Run 'apt list --upgradable' to see them.

....
@terraform-ins1:~$ sudo apt install docker-ce
```
Once the installation is completed the Docker service will start automatically. To verify it type in:
```python
@terraform-ins1:~$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
   Active: active (running) since Tue 2020-08-11 06:48:49 UTC; 48s ago
     Docs: https://docs.docker.com
 Main PID: 12890 (dockerd)
   CGroup: /system.slice/docker.service
           └─12890 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Aug 11 06:48:49 terraform-ins1 dockerd[12890]: time="2020-08-11T06:48:49.548955290Z" level=warning msg="Your kernel
Aug 11 06:48:49 terraform-ins1 dockerd[12890]: time="2020-08-11T06:48:49.549520161Z" level=warning msg="Your kernel
Aug 11 06:48:49 terraform-ins1 dockerd[12890]: time="2020-08-11T06:48:49.550006530Z" level=warning msg="Your kernel
Aug 11 06:48:49 terraform-ins1 dockerd[12890]: time="2020-08-11T06:48:49.550531564Z" level=info msg="Loading contai
Aug 11 06:48:49 terraform-ins1 dockerd[12890]: time="2020-08-11T06:48:49.720868994Z" level=info msg="Default bridge
Aug 11 06:48:49 terraform-ins1 dockerd[12890]: time="2020-08-11T06:48:49.788795594Z" level=info msg="Loading contai
Aug 11 06:48:49 terraform-ins1 dockerd[12890]: time="2020-08-11T06:48:49.803796852Z" level=info msg="Docker daemon"
Aug 11 06:48:49 terraform-ins1 dockerd[12890]: time="2020-08-11T06:48:49.804541392Z" level=info msg="Daemon has com
Aug 11 06:48:49 terraform-ins1 systemd[1]: Started Docker Application Container Engine.
Aug 11 06:48:49 terraform-ins1 dockerd[12890]: time="2020-08-11T06:48:49.849107825Z" level=info msg="API listen on 
lines 1-18/18 (END)
```
Verify Docker version
```python
@terraform-ins1:~$ docker -v
Docker version 19.03.12, build 48a66213fe
```
8. Add your user to the docker group.
```python
terraform-ins1:~$ sudo usermod -aG docker ${USER}
```

9. Create a directory named `terraform-docker-demo`
```python
@terraform-ins1:~$ mkdir terraform-docker-demo && cd $_
```
10. Create file [`main.tf`](https://github.com/juliehub/Terraform-Practice/blob/master/main.tf) to provision an NGINX server

11. Initialize the project, which downloads a plugin that allows Terraform to interact with Docker.
```python
@terraform-ins1:~$ terraform init

Initializing the backend...

Initializing provider plugins...
- Using previously-installed terraform-providers/docker v2.7.2

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, we recommend adding version constraints in a required_providers block
in your configuration, with the constraint strings suggested below.

* terraform-providers/docker: version = "~> 2.7.2"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see                                      
any changes that are required for your infrastructure. All Terraform commands                                      
should now work.                                                                                                   
                                                                                                                   
If you ever set or change modules or backend configuration for Terraform,                                          
rerun this command to reinitialize your working directory. If you forget, other                                    
commands will detect it and remind you to do so if necessary.                       
```
12. Create new resource
```python
@terraform-ins1:~/terraform-docker-demo$ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.nginx will be created
  + resource "docker_container" "nginx" {
      + attach           = false
      + bridge           = (known after apply)
      + command          = (known after apply)
.....


Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.nginx: Creating...
docker_image.nginx: Creation complete after 8s [id=sha256:08393e824c32d456ff69aec72c64d1ab63fecdad060ab0e8d3d42640fc3d64c5nginx:latest]
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=c9e2fda5100a8409bafccf51e482175d6c61eec8c8a27a2cb32b250575c368d6]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```
If you hit permission issue by running Docker using non-root user, you can try `terraform-ins1:~/terraform-docker-demo$ sudo chmod 666 /var/run/docker.sock`

13. Verify the existence of the NGINX container by visiting localhost:8000
```python
@terraform-ins1:~/terraform-docker-demo$ curl -l localhost:8000
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
@terraform-ins1:~/terraform-docker-demo$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
c9e2fda5100a        08393e824c32        "/docker-entrypoint.…"   2 minutes ago       Up 2 minutes        0.0.0.0:8000->80/tcp   tutorial
```
14. To stop the container, run terraform destroy
```python
@terraform-ins1:~/terraform-docker-demo$ terraform destroy
docker_image.nginx: Refreshing state... [id=sha256:08393e824c32d456ff69aec72c64d1ab63fecdad060ab0e8d3d42640fc3d64c5nginx:latest]
docker_container.nginx: Refreshing state... [id=c9e2fda5100a8409bafccf51e482175d6c61eec8c8a27a2cb32b250575c368d6]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # docker_container.nginx will be destroyed
  - resource "docker_container" "nginx" {
  
  Enter a value: yes

docker_container.nginx: Destroying... [id=c9e2fda5100a8409bafccf51e482175d6c61eec8c8a27a2cb32b250575c368d6]
docker_container.nginx: Destruction complete after 0s
docker_image.nginx: Destroying... [id=sha256:08393e824c32d456ff69aec72c64d1ab63fecdad060ab0e8d3d42640fc3d64c5nginx:latest]
docker_image.nginx: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.
```

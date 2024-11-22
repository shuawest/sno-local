
# Single-Node OpenShift on Apple Silicon with UTM and QEMU

Automation for managing SNO openshift or microshift using UTM on Apple Silicon. 
Configures AWS Route53 for DNS resolution and optionally TLS 
certificates. 
Bootstrap configuration using gitops across multiple installs.


## Roadmap

Ansible
* Bootstrap GitOps
* Select projects to gitops sync in inventory
* Configuration at inventory level instead of in playbook
* Add cluster provisioning summary
* Cluster diagnostics playbooks
* Cluster backup and restore playbooks
* Apple Hypervisor intead of QEMU
* Determine if it is possible to clone and rename cluster
* Use mirror installation for faster provisioning
* Provision both OpenShift and Microshift

GitOps
* Local storage
* LVM storage




# Apple UTM Hypervisor Configuration


## I. Usage

### 1. Provision a cluster

```
# Clone the repository 
git clone https://github.com/shuawest/sno-local.git

# Edit the inventory for your cluster name
cd sno-local/ansible
cp inventories/group_vars/sno-local.yml.example inventories/group_vars/<mycluster_name>.yml

# Configure your secrets - choose between using an ansible-vault or 1Password
...

# Configure your SNO cluster settings 
vi inventories/group_vars/<mycluster_name>.yml

# If first time running - prepare ansible
pip install -r requirements.txt
ansible-galaxy collection install -r requirements.yaml

# Provision the cluster 
./ap.sh playbook/sno.yml
```

## II. Setup 

1. Install UTM on MacOS
   https://mac.getutm.app/ 
  
2. Install Podman / Podman Desktop for MacOS

3. Download command line tools and install to /usr/local/bin from https://console.redhat.com/openshift/downloads

  - Ansible
    `brew install ansible`
  - OpenShift for arm insaller - MacOS / arm64
    https://mirror.openshift.com/pub/openshift-v4/aarch64/clients/ocp/stable/openshift-install-mac-arm64.tar.gz
  - OpenShift client
    https://mirror.openshift.com/pub/openshift-v4/aarch64/clients/ocp/stable/openshift-client-mac-arm64.tar.gz
    or `brew install openshift-cli`
  - Helm 3 CLI
    https://mirror.openshift.com/pub/openshift-v4/clients/helm/latest/helm-darwin-arm64.tar.gz
    or `brew install helm`
  - ODO Developer CLI for OpenShift
    https://developers.redhat.com/content-gateway/rest/mirror/pub/openshift-v4/clients/odo/latest/odo-darwin-arm64.tar.gz
    or `brew install odo`
  - ArgoCD GitOps CLI
    https://developers.redhat.com/content-gateway/rest/browse/pub/openshift-v4/clients/openshift-gitops/latest/argocd-macos-arm64.tar.gz
    or `brew install argocd`
  - Tekton CLI
    https://mirror.openshift.com/pub/openshift-v4/clients/pipeline/latest/tkn-macos-arm64.tar.gz
    or `brew install tektoncd-cli`

4. Configure your secrets in an ansible-vault or 1Password

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




## IV. Reference Resources

- Single-Node OpenShift
  https://docs.openshift.com/container-platform/4.17/installing/nstalling_sno/install-sno-installing-sno.html

- OpenShift Agent-based installer
  https://docs.openshift.com/container-platform/4.17/installing/installing_with_agent_based_installer/preparing-to-install-with-agent-based-installer.html

- Repo Single Node OpenShift on ARM Mac
  https://github.com/tnk4on/sno-on-arm-mac

- Troubleshooting Installations
  https://docs.openshift.com/container-platform/4.17/support/troubleshooting/troubleshooting-installations.html 

- Minimum SNO requirements
  - vCPUs:   8 to 10
  - memory:  16 GB
  - storage: 120 GB

- Scripting UTM
  https://docs.getutm.app/scripting/cheat-sheet/ 
  https://docs.getutm.app/scripting/reference/
  https://blog.vkhitrin.com/creating-a-utm-virtual-machine-from-cli/



## V. Troubleshooting

### 1. "UTM got an error: The file couldn’t be opened because it doesn’t exist."

Cause: This error occors while creating a UTM VM using apple script. It is because UTM sees two VMs with the same name.  

Resolution: Manually delete the VMs in UTM with the target name. Restart the UTM app. Ensure the VMs with the target name are fully removed. Start the provisioning script again.


### 2. "Unable to ping quay.io" during the initial agent installer boot process

Cause: The network settings in the install-config.yml and/or agent-config.yml are causing the target VM to not be able to reach the internet. To troubleshoot this issue, first skip the checks and continue the boot from the terminal menu using the quit button.
Then, ssh into the machine from the macos hypervisor host `ssh core@<vm_ip_addr>`. Use the nmcli tool `sudo nmcli con print` and`sudo nmcli con edit enp0s1` to review and modify the network settings until you can reach the internet using `ping quay.io` from the host. Incorporate the configuration changes into `roles/sno_agent/templates/agent-config.yml.j2`.

### 3. Watching installation during bootstrap phase

```
ssh core@<vm_ip_addr>
journalctl -b -f -u release-image.service -u bootkube.service
```

### 4. "INFO Cannot access Rendezvous Host. There may be a network configuration problem, check console for additional info"

Reverse lookup is needed for SNO if DHCP isn't providing the name resolution. CHeck that you have a PTR record for your node, and ensure the sno host can resolve forward and reverse:

```
ssh core@<vm_ip_addr>
dig sno.<myhost>.local.milabs.io
dig -X <vm_ip_addr>
```


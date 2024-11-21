
# Apple UTM Hypervisor Configuration


## Reference Resources

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



## Constraints
* Unable to set a static IP on a shared network
* MAC Addresses and IPs cannot be reused
* You can set the address ranges in the advanced settings
* 


## New Approach

1. download coreos to staging directory
2. create a VM in UTM - taking networking defaults
3. attach and start coreos basic image
4. use apple script to scrape the IP & Mac address, and emit to cachable facts
5. use ip & mac in agent image create
6. attach and start the agent rhcos image 
7. use agent installer to complete




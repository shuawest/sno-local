
# Single-Node OpenShift on Apple Silicon with UTM and QEMU

Automation for managing SNO openshift or microshift using UTM on Apple Silicon. 
Configures AWS Route53 for DNS resolution and optionally TLS 
certificates. 
Bootstrap configuration using gitops across multiple installs.


FIX machine network CIDR in agent/install config to match
   consider reusing or redoing calculation

MAC still getting rewritten 
   consider booting coreos first and getting assigned IP and Mac instead of setting explicitly

Register sno machine IP address in Route53
    change name of machine in install-config to sno from sno-master



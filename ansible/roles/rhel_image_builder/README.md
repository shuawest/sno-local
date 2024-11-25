
## RHEL Image Builder VM instance


## Reference Resources

* https://docs.redhat.com/en/documentation/red_hat_build_of_microshift/4.12/html-single/installing/index#adding-microshift-repos-image-builder_microshift-embed-in-rpm-ostree
* https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html/composing_installing_and_managing_rhel_for_edge_images/setting-up-image-builder_composing-installing-managing-rhel-for-edge-images#edge-image-builder-system-requirements_setting-up-image-builder
* https://www.opensourcerers.org/2023/11/20/kubernetes-at-the-edge-microshift-on-raspberry-pi-4-using-fedora-iot/
* https://www.opensourcerers.org/2022/01/17/openshift-on-raspberry-pi-4/
* https://medium.com/@ben.swinney_ce/openshift-raspberry-pi-2e78f2990395


 need to serve the image on a web server accessible to the local network
 a. Option 1: ownload the image and offer it up via podman from the macos host interface
    - this would require opening the firewall to allow access to network interface (8000?)
    https://www.youtube.com/watch?v=XNkIOYvCPWY
 b. Option 2: Can image be served through cockpit on the Imager Builder host directly?

 macos
 - firewall - https://rolfje.wordpress.com/2014/05/10/open-a-port-in-osx-mavericks-firewall/ 


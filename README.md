### About

This is a guide with scripts to facilitate the installation of an OCP IPI virtual machine to deploy baremetal masters and workers. 

Based on [OCP 4.8 IPI Installation](https://docs.openshift.com/container-platform/4.8/installing/installing_bare_metal_ipi/ipi-install-installation-workflow.html)

##### [Prequisites](https://github.com/drykxs/kni/blob/main/Prereqs.md): To run the provisioner as a VM, the nested virtualization is required to be enabled. Also 2 virtual bridges, for baremetal and provisioning.

1. Create the `kni` user as the doc points to
2. Create the `install-config.yaml`
3. Create the `/etc/hosts` entries and the dnsmasq (`/etc/dnsmasq.d/abc.dns`)
4. Run, in this order:

   `baremetal.sh` 
   `provisioning.sh`
   `rhcos-img.sh`
   `cluster-img.sh`
   `podman-rhcos-img.sh`
   
   
5. Create the manifest:

    `./openshift-baremetal-install --dir ~/clusterconfigs create manifests`
    
6. Deploy:

   `./openshift-baremetal-install --dir ~/clusterconfigs --log-level debug create cluster` 

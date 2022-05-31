1. First booting the infra-node follow the Telco Lab practices to install the RHEL8.
2. Enable nested virtualization in the infra-node
    - Edit `/etc/modprobe.d/kvm.conf` adding line `options kvm_intel nested=1`
    - Reboot

3. Register with `subscription-manager` and update `podman`, `runc` and `libvirt`
4. Using the Webconsole create 2 virtual networks (Through the Virtual Machine tab, do not use the Networking one)
5. Create a VM with at least 4Gb memory and host-model CPU and 2 NAT interfaces
6. Run `virt-host-validate` in the host and guest. Also check the vmx flag in the `/proc/cpuinfo` 

#!/bin/bash
export BAREMETAL_IP=$(ip addr show dev baremetal | awk '/inet /{print $2}' | cut -d"/" -f1)
export RHCOS_OPENSTACK_SHA256=$(zcat /home/kni/rhcos_image_cache/${RHCOS_OPENSTACK_URI} | sha256sum | awk '{print $1}')
export RHCOS_QEMU_SHA256=$(zcat /home/kni/rhcos_image_cache/${RHCOS_QEMU_URI} | sha256sum | awk '{print $1}')
export CLUSTER_OS_IMAGE="http://${BAREMETAL_IP}:8080/${RHCOS_OPENSTACK_URI}?sha256=${RHCOS_OPENSTACK_SHA256}"
export BOOTSTRAP_OS_IMAGE="http://${BAREMETAL_IP}:8080/${RHCOS_QEMU_URI}?sha256=${RHCOS_QEMU_SHA256}"
echo "${RHCOS_OPENSTACK_SHA256}  ${RHCOS_OPENSTACK_URI}" > /home/kni/rhcos_image_cache/rhcos-ootpa-latest.qcow2.sha256sum
echo "    bootstrapOSImage=${BOOTSTRAP_OS_IMAGE}"
echo "    clusterOSImage=${CLUSTER_OS_IMAGE}"

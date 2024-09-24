#!/bin/bash
sudo mkdir -p /opt/stack
sudo chown $USER /opt/stack

git clone https://opendev.org/openstack/devstack /opt/stack/devstack

cat > /opt/stack/devstack/local.conf << END 
[[local|localrc]]

RECLONE=no
GLANCE_LIMIT_IMAGE_SIZE_TOTAL=5000

DATABASE_PASSWORD=password
RABBIT_PASSWORD=password
SERVICE_PASSWORD=password
SERVICE_TOKEN=password
ADMIN_PASSWORD=password

# If your stack get failed with error: "Could not determine host ip address.
# See local.conf for suggestions on setting HOST_IP." Try to uncomment
# this line to set the proper host IP.
#HOST_IP="192.168.1.183"
HOST_IP=$(hostname -I| awk '{print $1}')

# Horizon (the web UI) is enabled by default. You may want to disable
# it here to speed up DevStack a bit.
enable_service horizon
#disable_service horizon

# Cinder (OpenStack Block Storage) is disabled by default to speed up
# DevStack a bit. You may enable it here if you would like to use it.
enable_service cinder c-sch c-api c-vol

# Disable Tempest - The OpenStack Integration Test Suite.
enable_service tempest

# Disable OpenStack Swift - the object/blob store service.
disable_service swift

# Disable ML2 OVN plugin, driver and services
disable_service ovn
disable_service ovn-controller
disable_service ovn-northd
disable_service q-ovn-metadata-agent

# Use openvswitch as the ml2 plugin driver
Q_AGENT=openvswitch

# Enable Neutron services neutron-server, neutron-openvswitch-agent,
# neutron-dhcp-agent, neutron-l3-agent and neutron-metadata-agent
enable_plugin neutron https://opendev.org/openstack/neutron
enable_service q-svc
enable_service q-agt
enable_service q-dhcp
enable_service q-l3
enable_service q-meta

enable_plugin barbican https://git.openstack.org/openstack/barbican
enable_service rabbit mysql key
#enable_plugin heat https://git.openstack.org/openstack/heat
#enable_plugin magnum https://git.openstack.org/openstack/magnum
VOLUME_BACKING_FILE_SIZE=200G
# Enable manila
#enable_plugin manila https://opendev.org/openstack/manila

#allow branches
#NOVA_REPO=https://review.opendev.org/openstack/nova
#NOVA_BRANCH=refs/changes/50/5050/1
CINDER_REPO=https://review.opendev.org/openstack/cinder
CINDER_BRANCH=refs/changes/37/913437/2
#git fetch https://review.opendev.org/openstack/cinder refs/changes/37/913437/2 && git checkout FETCH_HEAD
# Ceph
enable_plugin devstack-plugin-ceph https://opendev.org/openstack/devstack-plugin-ceph
ENABLE_CEPH_CINDER=True     # ceph backend for cinder
ENABLE_CEPH_GLANCE=True     # store images in ceph
ENABLE_CEPH_C_BAK=True      # backup volumes to ceph
ENABLE_CEPH_NOVA=True       # allow nova to use ceph resources
#ENABLE_CEPH_MANILA=True
#MANILA_CEPH_DRIVER=cephfsnfs

#MANILA_CEPH_GANESHA_RADOS_STORE=True
#MANILA_DHSS=True

[[post-config|/etc/neutron/neutron.conf]]
[DEFAULT]
debug = True
verbose = True

# Features available for ML2 OVS, uncomment to enforce DVR and L3 HA
#router_distributed=True
#l3_ha = True

# You can add more config options here for neutron.conf
# to achive more precise control of the functions for neutron server.

[[post-config|/etc/neutron/plugins/ml2/ml2_conf.ini]]
[ml2]
type_drivers=flat,gre,vlan,vxlan
tenant_network_types=vxlan
mechanism_drivers=openvswitch,l2population

[agent]
tunnel_types=vxlan,gre

# You can add more config options here for ml2_conf.ini, for instance
# you can uncomment the followings to set the segment ID ranges for
# various tenant network types.

#[ml2_type_vxlan]
#vni_ranges=1:10000

#[ml2_type_flat]
#flat_networks = *

#[ml2_type_gre]
#tunnel_id_ranges = 1:10000

#[ml2_type_vlan]
#network_vlan_ranges = tenant:1:1000

END

cd /opt/stack/devstack
./stack.sh

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
HOST_IP=$(hostname -I| awk '{print $1}')

# Horizon (the web UI) is enabled by default. You may want to disable
# it here to speed up DevStack a bit.
enable_service horizon
#disable_service horizon

#enable_plugin designate https://opendev.org/openstack/designate
#enable_service designate,designate-central,designate-api,designate-worker,designate-producer,designate-mdns

# Cinder (OpenStack Block Storage) is disabled by default to speed up
# DevStack a bit. You may enable it here if you would like to use it. 
disable_service cinder c-sch c-api c-vol

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

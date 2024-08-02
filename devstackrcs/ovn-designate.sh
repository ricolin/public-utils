#!/bin/bash
sudo mkdir -p /opt/stack
sudo chown $USER /opt/stack

git clone https://opendev.org/openstack/devstack /opt/stack/devstack

cat > /opt/stack/devstack/local.conf << END 
[[local|localrc]]
# General
GIT_BASE=https://github.com
VERBOSE=True

# Secrets
DATABASE_PASSWORD=password
RABBIT_PASSWORD=password
SERVICE_PASSWORD=password
SERVICE_TOKEN=password
ADMIN_PASSWORD=password

HOST_IP=$(hostname -I| awk '{print $1}')
SERVICE_HOST=$HOST_IP

# Keystone
KEYSTONE_ADMIN_ENDPOINT=true

# Glance
GLANCE_LIMIT_IMAGE_SIZE_TOTAL=10000

# Cinder
VOLUME_BACKING_FILE_SIZE=50G
disable_service cinder c-sch c-api c-vol

# Nova
LIBVIRT_TYPE=kvm

# Horizon 
enable_service horizon

#OVN
Q_AGENT=ovn
Q_ML2_PLUGIN_MECHANISM_DRIVERS=ovn,logger
Q_ML2_PLUGIN_TYPE_DRIVERS=local,flat,vlan,geneve
Q_ML2_TENANT_NETWORK_TYPE="geneve"

enable_service ovn-northd
enable_service ovn-controller
enable_service q-ovn-metadata-agent

# Use Neutron
enable_service q-svc

# Disable Neutron agents not used with OVN.
disable_service q-agt
disable_service q-l3
disable_service q-dhcp
disable_service q-meta

# Enable services, these services depend on neutron plugin.
enable_plugin neutron https://opendev.org/openstack/neutron
enable_service q-trunk
enable_service q-dns
enable_service q-port-forwarding
enable_service q-qos
enable_service neutron-segments
enable_service q-log

# How to connect to ovsdb-server hosting the OVN NB database.
OVN_NB_REMOTE=tcp:$SERVICE_HOST:6641

# How to connect to ovsdb-server hosting the OVN SB database.
OVN_SB_REMOTE=tcp:$SERVICE_HOST:6642


# Neutron
FIXED_RANGE=10.1.0.0/20

# Barbican
enable_plugin barbican https://opendev.org/openstack/barbican

# Octavia
enable_plugin octavia https://opendev.org/openstack/octavia
enable_plugin ovn-octavia-provider https://opendev.org/openstack/ovn-octavia-provider
enable_service octavia o-api o-cw o-hm o-hk o-da

# Designate
#enable_plugin designate https://opendev.org/openstack/designate
#enable_service designate,designate-central,designate-api,designate-worker,designate-producer,designate-mdns


END

cd /opt/stack/devstack
./stack.sh

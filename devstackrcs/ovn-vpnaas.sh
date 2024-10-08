#!/bin/bash
sudo mkdir -p /opt/stack
sudo chown $USER /opt/stack

git clone https://opendev.org/openstack/devstack /opt/stack/devstack

cat > /opt/stack/devstack/local.conf << END 
[[local|localrc]]
DATABASE_PASSWORD=password
RABBIT_PASSWORD=password
SERVICE_PASSWORD=password
SERVICE_TOKEN=password
ADMIN_PASSWORD=password

Q_AGENT=ovn
Q_ML2_PLUGIN_MECHANISM_DRIVERS=ovn,logger
Q_ML2_PLUGIN_TYPE_DRIVERS=local,flat,vlan,geneve
Q_ML2_TENANT_NETWORK_TYPE=geneve

LOGFILE="/opt/stack/logs/devstacklog.txt"

enable_service ovn-northd
enable_service ovn-controller
enable_service q-ovn-metadata-agent
enable_service q-ovn-vpn-agent
enable_service q-svc
enable_service q-log

# Disable Neutron agents not used with OVN.
disable_service q-agt
disable_service q-l3
disable_service q-dhcp
disable_service q-meta

enable_plugin neutron https://opendev.org/openstack/neutron
enable_plugin neutron-tempest-plugin https://opendev.org/openstack/neutron-tempest-plugin.git
enable_plugin neutron-vpnaas https://opendev.org/openstack/neutron-vpnaas.git

# Horizon (the web UI) is enabled by default. You may want to disable
# it here to speed up DevStack a bit.
enable_service horizon

# disable_service cinder c-sch c-api c-vol c-bak

#new
# OVN_BUILD_MODULES=True
#new
# ENABLE_CHASSIS_AS_GW=True

# IPsec driver to use. Optional, defaults to strongswan.
IPSEC_PACKAGE="strongswan"


END

cd /opt/stack/devstack
./stack.sh

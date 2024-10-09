#!/bin/bash
sudo mkdir -p /opt/stack
sudo chown $USER /opt/stack

git clone https://opendev.org/openstack/devstack /opt/stack/devstack
git clone https://opendev.org/openstack/ovn-octavia-provider /opt/stack/ovn-octavia-provider
cd /opt/stack/ovn-octavia-provider
git fetch https://review.opendev.org/openstack/ovn-octavia-provider refs/changes/47/925747/23 && git checkout FETCH_HEAD

cat > /opt/stack/devstack/local.conf << END 

[[local|localrc]]

RECLONE=no
DATABASE_PASSWORD=password
RABBIT_PASSWORD=password
SERVICE_PASSWORD=password
SERVICE_TOKEN=password
ADMIN_PASSWORD=password

# Logging
# -------

# By default ``stack.sh`` output only goes to the terminal where it runs.  It can
# be configured to additionally log to a file by setting ``LOGFILE`` to the full
# path of the destination log file.  A timestamp will be appended to the given name.
LOGFILE=/opt/stack/logs/stack.sh.log

# Old log files are automatically removed after 7 days to keep things neat.  Change
# the number of days by setting ``LOGDAYS``.
LOGDAYS=2

# Nova logs will be colorized if ``SYSLOG`` is not set; turn this off by setting
# ``LOG_COLOR`` false.
#LOG_COLOR=False

# Enable OVN
Q_AGENT=ovn
Q_ML2_PLUGIN_MECHANISM_DRIVERS=ovn,logger
Q_ML2_PLUGIN_TYPE_DRIVERS=local,flat,vlan,geneve
Q_ML2_TENANT_NETWORK_TYPE="geneve"

# Enable OVN services
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
#enable_service q-qos

# Enable octavia tempest plugin tests
enable_plugin octavia-tempest-plugin https://opendev.org/openstack/octavia-tempest-plugin
enable_service horizon

# Cinder (OpenStack Block Storage) is disabled by default to speed up
# DevStack a bit. You may enable it here if you would like to use it.
disable_service cinder c-sch c-api c-vol

# A UUID to uniquely identify this system.  If one is not specified, a random
# one will be generated and saved in the file 'ovn-uuid' for re-use in future
# DevStack runs.
#OVN_UUID=

# If using the OVN native layer-3 service, choose a router scheduler to
# manage the distribution of router gateways on hypervisors/chassis.
# Default value is leastloaded.
#OVN_L3_SCHEDULER=leastloaded

# The DevStack plugin defaults to using the ovn branch from the official ovs
# repo.  You can optionally use a different one.  For example, you may want to
# use the latest patches in blp's ovn branch (and see OVN_BUILD_FROM_SOURCE):
#OVN_REPO=https://github.com/blp/ovs-reviews.git
#OVN_BRANCH=ovn

# NOTE: When specifying the branch, as shown above, you must also enable this!
# By default, OVN will be installed from packages. In order to build OVN from
# source, set OVN_BUILD_FROM_SOURCE=True
#OVN_BUILD_FROM_SOURCE=False

# If the admin wants to enable this chassis to host gateway routers for
# external connectivity, then set ENABLE_CHASSIS_AS_GW to True.
# Then devstack will set ovn-cms-options with enable-chassis-as-gw
# in Open_vSwitch table's external_ids column.
# If this option is not set on any chassis, all the of them with bridge
# mappings configured will be eligible to host a gateway.
ENABLE_CHASSIS_AS_GW=True

# If you wish to use the provider network for public access to the cloud,
# set the following
#Q_USE_PROVIDERNET_FOR_PUBLIC=True

# Create public bridge
OVN_L3_CREATE_PUBLIC_NETWORK=True

# This needs to be equalized with Neutron devstack
PUBLIC_NETWORK_GATEWAY="172.24.4.1"

# Octavia configuration
OCTAVIA_NODE="api"
DISABLE_AMP_IMAGE_BUILD=True
enable_plugin barbican https://opendev.org/openstack/barbican
enable_plugin octavia https://opendev.org/openstack/octavia
enable_plugin octavia-dashboard https://opendev.org/openstack/octavia-dashboard
LIBS_FROM_GIT+=python-octaviaclient
enable_service octavia
enable_service o-api
enable_service o-hk
enable_service o-da
disable_service o-cw
disable_service o-hm

# OVN octavia provider plugin
enable_plugin ovn-octavia-provider https://opendev.org/openstack/ovn-octavia-provider

[[post-config|$NOVA_CONF]]
[scheduler]
discover_hosts_in_cells_interval = 2

END

cd /opt/stack/devstack
./stack.sh

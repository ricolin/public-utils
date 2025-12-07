#!/bin/bash
sudo mkdir -p /opt/stack
sudo chown $USER /opt/stack

git clone https://opendev.org/openstack/devstack /opt/stack/devstack

cat > /opt/stack/devstack/local.conf << END 
[[local|localrc]]
# Credentials
ADMIN_PASSWORD=password
DATABASE_PASSWORD=password
RABBIT_PASSWORD=password
SERVICE_PASSWORD=password
SERVICE_TOKEN=password
SWIFT_HASH=password
SWIFT_TEMPURL_KEY=password

# Set glance's default limit to be baremetal image friendly
GLANCE_LIMIT_IMAGE_SIZE_TOTAL=5000

# Enable Ironic plugin
enable_plugin ironic https://opendev.org/openstack/ironic

# Disable nova novnc service, ironic does not support it anyway.
disable_service n-novnc

# Enable Swift for the direct deploy interface.
enable_service s-proxy s-object s-container s-account

# Disable Horizon
disable_service horizon

# Disable Cinder
disable_service cinder c-sch c-api c-vol

# Configure networking by disabling OVN and enabling Neutron w/OVS.
disable_service ovn-controller
disable_service ovn-northd
disable_service neutron-ovn-metadata-agent

enable_service neutron-agent q-agt
enable_service neutron-dhcp q-dhcp
enable_service neutron-l3 q-l3
enable_service neutron-metadata-agent q-meta
enable_service neutron-api q-svc
Q_AGENT=openvswitch
Q_ML2_PLUGIN_MECHANISM_DRIVERS="openvswitch"
Q_ML2_TENANT_NETWORK_TYPE="vxlan"
Q_USE_SECGROUP="False"

# By default, devstack assumes you have IPv4 and IPv6 access. If you are on
# a host with IPv6 disabled, set the value below.
# IP_VERSION=4

# Swift temp URL's are required for the direct deploy interface
SWIFT_ENABLE_TEMPURLS=True

# Support via emulated BMC exists for the following hardware types, and
# VMs to back them will be created by default unless IRONIC_IS_HARDWARE is
# True.
#  - ipmi (VirtualBMC)
#  - redfish (sushy-tools)
#
# If you wish to change the default driver for nodes created by devstack,
# you can do so by setting IRONIC_DEPLOY_DRIVER to the name of the driver
# you wish used by default, and ensuring that driver (along with others) is
# enabled.
IRONIC_DEPLOY_DRIVER=ipmi

# Example: Uncommenting these will configure redfish by default
#IRONIC_ENABLED_HARDWARE_TYPES=redfish,ipmi,fake-hardware
#IRONIC_DEPLOY_DRIVER=redfish
# Don't forget that many hardware types require enabling of additional
# interfaces, most often power and management:
#IRONIC_ENABLED_MANAGEMENT_INTERFACES=redfish,ipmitool,fake
#IRONIC_ENABLED_POWER_INTERFACES=redfish,ipmitool,fake

IRONIC_VM_COUNT=3
IRONIC_BAREMETAL_BASIC_OPS=True
DEFAULT_INSTANCE_TYPE=baremetal

# You can also change the default deploy interface used.
#IRONIC_DEFAULT_DEPLOY_INTERFACE=direct

# The parameters below represent the minimum possible values to create
# functional nodes.
IRONIC_VM_SPECS_RAM=2500
IRONIC_VM_SPECS_DISK=10

# Size of the ephemeral partition in GB. Use 0 for no ephemeral partition.
IRONIC_VM_EPHEMERAL_DISK=0

# To build your own IPA ramdisk from source, set this to True
IRONIC_BUILD_DEPLOY_RAMDISK=False

VIRT_DRIVER=ironic

# By default, DevStack creates a 10.0.0.0/24 network for instances.
# If this overlaps with the hosts network, you may adjust with the
# following.
# NETWORK_GATEWAY=10.1.0.1
# FIXED_RANGE=10.1.0.0/24
# FIXED_NETWORK_SIZE=256

# Log all output to files
LOGFILE=$HOME/devstack.log
LOGDIR=$HOME/logs
IRONIC_VM_LOG_DIR=$HOME/ironic-bm-logs

END

cd /opt/stack/devstack
./stack.sh

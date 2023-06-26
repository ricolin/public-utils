#!/bin/bash

pattern='^\{?[A-Z0-9a-z]{8}-[A-Z0-9a-z]{4}-[A-Z0-9a-z]{4}-[A-Z0-9a-z]{4}-[A-Z0-9a-z]{12}\}?$'

for volume in $(openstack volume list --project $1|grep "in-use"|awk '{print $2}')
#for volume in $(openstack volume list --all-projects|grep "in-use"|awk '{print $2}')
do
    echo 'checking volume: ' $volume
    server=$(openstack volume show $volume -c attachments|grep -o "server_id': '[0-9a-z-]*'"|cut -d "'" -f3)
    if [[ "$server" =~ $pattern ]]; then
        echo 'checking server: ' $server
        show_result=$(openstack server show $server 2>&1)
        if echo $show_result|grep "No server with a name"; then
            echo "Not found server" $server "start purge volume" $volume
            project_id=$(openstack volume show $volume|grep os-vol-tenant-attr:tenant_id|cut -d ' ' -f6)
            echo $volume >> ./tbd.$project_id
            #openstack volume set --detached $volume
            #sleep 2
            #openstack volume delete $volume
        else
            echo "Found server " $server
        fi
    else
        echo "not getting valid uuid: " $server
    fi
done

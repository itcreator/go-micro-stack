#!/usr/bin/env sh
set -ex

consul agent -server -bootstrap-expect 1 -data-dir /tmp/consul -node=agent-one &

i="0"
while [ $i -lt 20 ] #waiting for cluster 20 seconds
do
#    ((i++))
    i=$[$i+1]
    sleep 1

    agents=$(echo $CONSUL_AGENTS | tr ":" "\n")

    ##join consul agents
    RESULT=1
    for agent in $agents
    do
        consul join $agent
        res=$?
        if [ $res -ne 0 ]; then
            RESULT=false
        fi
    done

    if [ $RESULT -eq 1 ]; then
        echo "Consul cluster is ready"
        consul members

        tail -f /dev/null #run empty process
    else
        echo "cluster doesn't ready. waiting...\r\n"
    fi

    consul members
done

echo "Error: Consul cluster doesn't start"
consul members
exit 1

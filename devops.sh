#!/bin/bash
#
# This will automatically install a lot of the packages for a quick start.

# Flag this as a proper starting point
export INSTALL_SCRIPT=true

# Allow an install to pause a brief moment after running
export SKIP_SLEEP=false

# The base script if needed
export BASE_SCRIPT='desktop'

# Source Temporary Environment Variables.
source ./bin/_export_path_variables.sh

# Source the variables so they are exported and assigned
source ./bin/_export_user_variables.sh

echo "====================================================================="
echo ""
echo "                        JREAM - Ubuntu Server                        "
echo ""
echo " * To exit at anytime press CTRL+C"
echo " * Installation runs after command is entered."
echo ""
echo "====================================================================="
echo ""

while true; do
cat <<- command_list
    DevOps:
    -------
    awscli         Install AWS CLI tools
    docker         Install Docker
    docker-compose Install Docker Compose
    docker-machine Install Docker Machine
    docker-ac      Install Docker Autocomplete CLI
    ansible        Install Ansible Provisioner
    hyper          Install Hypercontainer (Hypervisor-agnostic Docker Runtime)
    hypercli       Install Hyper.sh CLI (PaaS Tool for hyper.sh)
    logstash       Install LogStash
    now            Install Zeit.co Now Binary
    saltstack      Install Saltstack Provisioner
    consul         Install Hashicorp Consul
    nomad          Install Hashicorp Nomad
    packer         Install Hashicorp Packer
    ptrsyslog      Install Hashicorp PaperTrail Syslog2
    serf           Install Hashicorp Serf
    terraform      Install Hashicorp Terraform
    vault          Install Hashicorp Vault
    vagrant        Install Hashicorp Vagrant

    Deployment
    ----------
    rocketeer      Install PHP Deployment System
    capistrano     Install Ruby Capistrano

    Benchmarking:
    -------------
    iperf          Install iperf CLI util
    sysbench       Install sysbench CLI util
    wrk2           Install wrk2 CLI util

    Utilities:
    ----------
    security      Install ClamAV, RKHunter (read instructions after install)

    Quit:
    -----
    q             Quit (or CTRL + C)

command_list

echo ""
echo "====================================================================="
echo ""

read -p "Type a Command: " cmd

    case $cmd in
        awscli)
            bash ./bin/devops/awscli.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        consul)
            bash ./bin/devops/hashicorp/consul.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        docker)
            bash ./bin/devops/docker.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        docker-ac)
            bash ./bin/devops/docker-ac.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        docker-compose)
            bash ./bin/devops/docker-compose.sh
            echo ""
            echo "====================================================================="
            ;;
        docker-machine)
            bash ./bin/devops/docker-machine.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        hyper)
            bash ./bin/devops/hypercontainer.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        hypersh)
            bash ./bin/devops/hypersh.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        iperf)
            bash ./bin/devops/benchmark/iperf.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        logstash)
            bash ./bin/devops/logstash.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        now)
            bash ./bin/devops/now.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        nomad)
            bash ./bin/devops/hashicorp/nomad.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        packer)
            bash ./bin/devops/hashicorp/packer.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        ptrsyslog)
            bash ./bin/devops/papertrail-rsyslog2.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;

        rocketeer)
            bash ./bin/devops/rocketeer.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        saltstack)
            bash ./bin/devops/saltstack.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        serf)
            bash ./bin/devops/hashicorp/serf.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        saltstack)
            bash ./bin/devops/saltstack.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        security)
            bash ./bin/security.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        sysbench)
            bash ./bin/devops/benchmark/sysbench.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        terraform)
            bash ./bin/devops/hashicorp/terraform.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        vagrant)
            bash ./bin/devops/hashicorp/vagrant.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        vault)
            bash ./bin/devops/hashicorp/vault.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        wrk2)
            bash ./bin/devops/benchmark/wrk2.sh
            echo ""
            echo "====================================================================="
            echo ""
            ;;
        q)
            exit 1
            ;;
        *)
            echo ""
            echo "    (!) OOPS! You typed a command that's not available."
            echo ""
            echo "====================================================================="
            echo ""

    esac


done

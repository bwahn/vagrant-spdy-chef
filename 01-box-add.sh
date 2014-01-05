#!/bin/sh
#vagrant box add openplatform-base http://files.vagrantup.com/precise64.box
echo "######################################################################"
echo "vagrant box add nginx-standalone ./templates/precise64.box"
vagrant box add nginx-standalone ../templates/precise64.box 

vcloud-director-shutdown
=================

Simple Ruby script to shutdown vApps when not in use e.g. evenings/weekends

Requirements
-----------

Requires Ruby and the fog Ruby gem.

*gem install fog*

Installation
-----------

1. Copy the script to somewhere sensible e.g. /usr/local/bin onto a server or machine which has access to your vcloud director API.

2. Configure your vcloud director api credentials

@vcloud_director_username='abc@abc'

@vcloud_director_password='password'

@vcloud_director_host='api.vcd.example.com'

3. Configure the vApps you wish to power off/on with the script, and specify the org and vdc they are contained in.

@selected_org = "org1"

@selected_vdc = "vdc1"

@selected_vapps_to_shutdown = ['vapp1', 'vapp2', 'vapp3', 'vapp4']

Usage
-----------

power off the vApps

ruby vcloud-director-shutdown.rb *off*

power on the vApps

ruby vcloud-director-shutdown.rb *on*

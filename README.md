vcloud-director-shutdown
=================

Script to shutdown vApps when not in use e.g. evenings/weekends

Assumptions
-----------

Requires Ruby and the fog Ruby gem.

*gem install fog*

Installation
-----------

Copy the script to somewhere sensible, which has access to your vcloud-director environment.

Configure your vcloud director api credentials

@vcloud_director_username='abc@abc'
@vcloud_director_password='password'
@vcloud_director_host='api.vcd.example.com'

Configure the vApps you wish to power off/on with the script

@selected_org = "org1"
@selected_vdc = "vdc1"
@selected_vapps_to_shutdown = ['vapp1', 'vapp2', 'vapp3', 'vapp4']

Usage
-----------

#powering off some vApps

ruby vcloud-director-shutdown.rb *off*

#powering on some vApps

ruby vcloud-director-shutdown.rb *on*

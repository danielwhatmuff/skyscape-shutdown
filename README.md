vcloud-director-shutdown
=================

Script to shutdown vApps when not in use e.g. evenings/weekends

Assumptions
-----------

haproxy at /usr/sbin/haproxy (default for yum install haproxy)

Installation
-----------

Copy the script to somewhere sensible, which has access to your vcloud-director environment.

Configure your vcloud director api credentials

@vcloud_director_username='abc@abc'
@vcloud_director_password='password'
@vcloud_director_host='api.vcd.example.com'

Configure the vApps you wish to power off/on with the script



Usage
-----------

#powering off some vApps

ruby vcloud-director-shutdown.rb *off*

#powering on some vApps

ruby vcloud-director-shutdown.rb *on*

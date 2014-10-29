#!/usr/bin/ruby
###################################################################
# Author:      Daniel Whatmuff
# Description: Simple Ruby script to shutdown vapps within a certain vdc within an org in vcloud director environment (written against api version 5.1)
# Usage:       Can be scheduled with cron to stop/start non-critical environments out of hours or executed manually.
# Execution:   $ ruby ./vcloud-director-shutdown.rb <on|off>
###################################################################

#require the fog ruby gem
require 'fog'

#vcloud director credentials
vcloud_director_username=''
vcloud_director_password=''
vcloud_director_host=''

#what to power off or on?
selected_org = ""
selected_vdc = ""
selected_vapps_to_shutdown = ['', '', '']

#function to create connection to vcloud director
def create_connection(username, password, host)
  @vcloud = Fog::Compute::VcloudDirector.new(:vcloud_director_username => username,
                                            :vcloud_director_password => password,
                                            :vcloud_director_host => host)
end

#function to power off or on some vapps passed as an array
def power_off_on(on_off, org, vdc, vapps)
  org = @vcloud.organizations.get_by_name(org)
  vdc = org.vdcs.get_by_name(vdc)
  if on_off == "on"
    vapps.each { |vapp_sd| vdc.vapps.get_by_name(vapp_sd).power_on }
  elsif on_off == "off"
    vapps.each { |vapp_sd| vdc.vapps.get_by_name(vapp_sd).power_off }
  end
end

if ARGV[0] == "on"
  create_connection(vcloud_director_username, vcloud_director_password, vcloud_director_host)
  power_off_on("on", selected_org, selected_vdc, selected_vapps_to_shutdown)
elsif ARGV[0] == "off"
  create_connection(vcloud_director_username, vcloud_director_password, vcloud_director_host)
  power_off_on(off)
  power_off_on("off", selected_org, selected_vdc, selected_vapps_to_shutdown)
else
  puts "Usage: ./vcloud-director-shutdown.rb <on|off>"
end

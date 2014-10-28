#!/usr/bin/ruby
require 'fog'

#skyscape credentials
@skyscape_username='abc@abc'
@skyscape_password='password'
@skyscape_host='api.vcd.portal.skyscapecloud.com'

#what to shutdown
@regt_vdc = "vdc1"
@regt_org = "org1"
@regt_vapps_to_shutdown = ['vapp1', 'vapp2', 'vapp3', 'vapp4']

def create_connection(username, password, host)
  @vcloud = Fog::Compute::VcloudDirector.new(:vcloud_director_username => username,
                                            :vcloud_director_password => password,
                                            :vcloud_director_host => host)
end

def power_off_on(on_off, org, vdc, vapps)
  @org = @vcloud.organizations.get_by_name(@org)
  @vdc = @org.vdcs.get_by_name(@vdc)
  if on_off == "on"
    @regt_vapps_to_shutdown.each { |vapp_sd| vdc.vapps.get_by_name(vapp_sd).power_on }
  elsif on_off == "off"
    @regt_vapps_to_shutdown.each { |vapp_sd| vdc.vapps.get_by_name(vapp_sd).power_off }
  end
end

if ARGV[0] == "on"
  create_connection(@skyscape_username, @skyscape_password, @skyscape_host)
  power_off_on("on", @regt_org, @regt_vdc, @regt_vapps_to_shutdown)
elsif ARGV[0] == "off"
  create_connection(@skyscape_username, @skyscape_password, @skyscape_host)
  power_off_on(off)
  power_off_on("off", @regt_org, @regt_vdc, @regt_vapps_to_shutdown)
else
  puts "Usage: ./skyscape-shutdown.rb <on|off>"
end

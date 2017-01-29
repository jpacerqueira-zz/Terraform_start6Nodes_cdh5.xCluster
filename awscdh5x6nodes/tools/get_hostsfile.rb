#!/usr/bin/env ruby
# NOTICE: AWS provider only

require 'json'
require 'erb'

def get_template()
%{
COPY this to your PC's /etc/hosts
<% hosts.each do |key, entry| %>
<%= entry[:publicip] %>            <%= entry[:tf_hostname] %>
<% end %>


RUN nn1elephant via  connect_to_nn1elephant.sh (to connect on nn1elephant)
On nn1elephant, run: CM_config_hosts.sh (adding in the settings below)
<% hosts.each do |key, entry| %>
<%= entry[:privateip] %>            <%= entry[:tf_hostname] %>
<% end %>
}
end

class SshConfig
  attr_accessor :hosts

  def initialize(hosts)
    @hosts = hosts
  end

  def get_binding
    binding()
  end
end

file = File.read('../terraform/terraform.tfstate')
data_hash = JSON.parse(file)

hosts = {}

data_hash['modules'][0]['resources'].each do |key, resource|

  if ['aws_instance'].include?(resource['type'])
    attributes = resource['primary']['attributes']
    name = attributes['id']
    privateip = attributes['private_ip']
    publicip = attributes['public_ip']
    hostname = attributes['access_ip_v4'] || attributes['network_interface.0.access_config.0.assigned_nat_ip'] || attributes['ipv4_address']
    index = 'template_file.cdh_init.' + key.split(".").last
    cloudinit_file = data_hash['modules'][0]['resources'][index]
    tf_hostname = cloudinit_file['primary']['attributes']['vars.tf_hostname']

    if resource['type'] == 'digitalocean_droplet'
      user = 'root'
    else
      user = 'ubuntu'
    end

    hosts[name] = {
      :hostname => hostname,
      :name => name,
      :privateip => privateip,
      :publicip => publicip,
      :tf_hostname => tf_hostname,
    }
  end
end

renderer = ERB.new(get_template)

puts renderer.result(SshConfig.new(hosts).get_binding)

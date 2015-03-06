require 'json'

node[:deploy].each do |application, deploy|

  data = Hash[node[:opsworks][:instance]]
  data[:event] = 'Deploy'
  data[:application] = application
  data[:deploy] = deploy
  data_json = data.to_json.gsub("'", '')

  node['webhooks_deploy_url'].each do |url|

    execute 'POST' do
      command "curl -X POST -H 'Content-Type: application/json' -d '#{data_json}' '#{url}'"
    end
  end if node['webhooks_deploy_url'].is_a?(Array)
end

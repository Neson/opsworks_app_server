require 'json'

node['webhooks_configure_url'].each do |url|

  data = Hash[node[:opsworks][:instance]]
  data[:event] = 'Configure'
  data_json = data.to_json.gsub("'", '')

  execute 'POST' do
    command "curl -X POST -H 'Content-Type: application/json' -d '#{data_json}' '#{url}'"
  end
end if node['webhooks_configure_url'].is_a?(Array)

require 'json'

node['webhooks_setup_url'].each do |url|

  data = Hash[node[:opsworks][:instance]]
  data[:event] = 'Setup'
  data_json = data.to_json.gsub("'", '')

  execute 'POST' do
    command "curl -X POST -H 'Content-Type: application/json' -d '#{data_json}' '#{url}'"
  end
end if node['webhooks_setup_url'].is_a?(Array)

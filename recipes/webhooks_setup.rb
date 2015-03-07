require 'json'

node['webhooks_setup_url'].each do |url|

  data = Hash[node[:opsworks][:instance]]
  data[:event] = 'Setup'
  data_json = data.to_json

  http_request "post data to specified URL" do
    action :post
    url url
    message data_json
    headers("Content-Type" => "application/json")
  end

end if node['webhooks_setup_url'].is_a?(Array)

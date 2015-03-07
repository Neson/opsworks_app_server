require 'json'

node['webhooks_configure_url'].each do |url|

  data = Hash[node[:opsworks][:instance]]
  data[:event] = 'Configure'
  data_json = data.to_json

  http_request "post data to specified URL" do
    action :post
    url url
    message data_json
    headers("Content-Type" => "application/json")
  end

end if node['webhooks_configure_url'].is_a?(Array)

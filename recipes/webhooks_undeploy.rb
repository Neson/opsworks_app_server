require 'json'

node[:deploy].each do |application, deploy|

  data = Hash[node[:opsworks][:instance]]
  data[:event] = 'Undeploy'
  data[:application] = application
  data[:deploy] = deploy
  data_json = data.to_json

  node['webhooks_undeploy_url'].each do |url|

    http_request "post data to specified URL" do
      action :post
      url url
      message data_json
      headers("Content-Type" => "application/json")
    end

  end if node['webhooks_undeploy_url'].is_a?(Array)
end

require 'rubygems'
require 'tire'

r = ARGV.pop 
r = r ? r.to_i : 1

include Tire

puts %Q|curl -X PUT 'http://localhost:9200/webexpo/_settings' -d '{"index" : { "number_of_replicas" : #{r} }}'|

Configuration.client.put "#{Configuration.url}/webexpo/_settings",
                          { :index => { :number_of_replicas => r } }.to_json

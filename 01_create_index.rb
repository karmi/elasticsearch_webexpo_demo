require 'rubygems'
require 'tire'

Tire.configure { logger STDERR }

Tire.index('webexpo') do
  delete
  create :settings => { :number_of_shards => 3, :number_of_replicas => 0 }
end

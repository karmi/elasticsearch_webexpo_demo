# Generates data for index "webexpo"
STDOUT.sync = true

require 'rubygems'
require 'tire'

Tire.configure { logger STDERR }

documents = (1..90_000).map do |i|
  STDOUT.print( "\r"+"Generated \e[1m#{i}\e[0m documents." )

  { :id => i, :title => "Document #{i}" }
end

puts "", "Importing data into ElasticSearch..."

Tire.index('webexpo') do
  import documents
end

require 'rubygems'
require 'tire'

Tire.configure { logger STDERR }

Tire.index('webexpo') do
  store :title => "Hello red cluster!"
end

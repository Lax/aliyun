require 'rubygems'
require 'aliyun'

$DEBUG=false

options = {:access_key_id => "xxxxxx",
           :access_key_secret => "yyyyy",
           :service => :ecs}

service = Aliyun::Service.new options

parameters = {}

puts service.DescribeRegions parameters

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'aliyun'
require 'yaml'

def load_options(src='.aliyun.yml')
  YAML.load_file(src)
end

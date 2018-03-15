module Aliyun
  class VPCConfig < APIConfig
    def self.info
      "Aliyu VPC Service"
    end
    def self.endpoint
      'https://vpc.aliyuncs.com/'
    end
    def self.default_parameters
      {
        :Format=>"JSON",
        :Version=>"2016-04-28",
        :SignatureMethod=>"HMAC-SHA1",
        :SignatureVersion=>"1.0"
      }
    end
    def self.separator
      super
    end
    def self.http_method
      super
    end
  end
end

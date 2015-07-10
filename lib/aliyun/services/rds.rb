module Aliyun
  class RDSConfig < APIConfig
    def self.info
      "Aliyu RDS Service"
    end
    def self.endpoint
      'https://rds.aliyuncs.com/'
    end
    def self.default_parameters
      {
        :Format=>"JSON",
        :Version=>"2014-08-15",
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

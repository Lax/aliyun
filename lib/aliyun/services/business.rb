module Aliyun
  class BusinessConfig < APIConfig
    def self.info
      "Aliyu Business Service"
    end
    def self.endpoint
      'https://business.aliyuncs.com/'
    end
    def self.default_parameters
      {
        :Format=>"JSON",
        :Version=>"2017-12-14",
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

module Aliyun
  class STSConfig < APIConfig
    def self.info
      "Aliyu STS Service"
    end
    def self.endpoint
      'https://sts.aliyuncs.com/'
    end
    def self.default_parameters
      {
        :Format=>"JSON",
        :Version=>"2015-04-01",
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

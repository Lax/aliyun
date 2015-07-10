module Aliyun
  class RAMConfig < APIConfig
    def self.info
      "Aliyu RAM Service"
    end
    def self.endpoint
      'https://ram.aliyuncs.com/'
    end
    def self.default_parameters
      {
        :Format=>"JSON",
        :Version=>"2015-05-01",
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

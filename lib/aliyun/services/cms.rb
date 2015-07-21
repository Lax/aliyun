module Aliyun
  class CMSConfig < APIConfig
    def self.info
      "Aliyu CMS Service"
    end
    def self.endpoint
      'https://metrics.aliyuncs.com/'
    end
    def self.default_parameters
      {
        :Format=>"JSON",
        :Version=>"2015-04-20",
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

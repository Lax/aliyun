module Aliyun
  class CMSConfig < APIConfig
    def self.info
      "Aliyu CMS Service"
    end
    def self.endpoint
      raise "Service Endpoint Missing! endpoint_url: http://metrics.\%{Region}.aliyuncs.com/"
    end
    def self.default_parameters
      {
        :Format=>"JSON",
        :Version=>"2017-03-01",
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

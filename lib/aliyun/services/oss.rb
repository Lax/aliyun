module Aliyun
  class ECSConfig < APIConfig
    def self.info
      "Aliyu OSS Service (Object Storage Service)"
    end
    def self.endpoint
      'https://oss-cn-hangzhou.aliyuncs.com/'
    end
    def self.default_parameters
      {
        :Format=>"JSON",
        :Version=>"2014-05-26",
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

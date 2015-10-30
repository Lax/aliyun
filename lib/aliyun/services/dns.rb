module Aliyun
  class DNSConfig < APIConfig
    def self.info
      "Aliyu DNS Service"
    end
    def self.endpoint
      'http://dns.aliyuncs.com/'
    end
    def self.default_parameters
      {
        :Format=>"JSON",
        :Version=>"2015-01-09",
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

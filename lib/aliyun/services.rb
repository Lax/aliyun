module Aliyun
  class ECSConfig < APIConfig
    def self.info
      "Aliyu ECS Service"
    end
    def self.endpoint
      'https://ecs.aliyuncs.com/'
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

  class SLBConfig < APIConfig
    def self.info
      "Aliyu SLB Service"
    end
    def self.endpoint
      'https://slb.aliyuncs.com/'
    end
    def self.default_parameters
      {
        :Format=>"JSON",
        :Version=>"2014-05-15",
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

  SERVICES = {
    :ecs => ECSConfig,
    :slb => SLBConfig
  }
end

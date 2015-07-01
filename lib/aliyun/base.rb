module Aliyun
  class APIConfig
    def self.info
      raise "Service Name Missing!"
    end
    def self.endpoint
      raise "Service Endpoint Missing!"
    end
    def self.default_parameters
      raise "Service Default Parameters Missing!"
    end
    def self.separator
      "&"
    end
    def self.http_method
      "GET"
    end
  end

  class AliyunAPIException < RuntimeError
  end
end

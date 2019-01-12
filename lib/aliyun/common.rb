require 'net/http'
require 'time'
require 'securerandom'
require 'uri'
require 'base64'
require 'hmac-sha1'
require 'json'

module Aliyun
  class Service
    attr_accessor :access_key_id, :access_key_secret
    attr_accessor :options
    attr_accessor :endpoint_url
    attr_accessor :service

    def initialize(options={})
      options[:service] ||= :ecs
      self.service = SERVICES[options[:service].to_sym]
      self.access_key_id = options[:access_key_id]
      self.access_key_secret = options[:access_key_secret]
      self.endpoint_url = options[:endpoint_url] || self.service.endpoint
      self.options = {:AccessKeyId => self.access_key_id}
    end

    def method_missing(method, *args)
      if $DEBUG
        puts "Not Found Method: #{method}"
      end

      if args[0].nil?
        raise AliyunAPIException.new "Method missing: #{method}!"
      end

      call_aliyun_with_parameter(method, args[0])
    end

    #Dispatch the request with parameter
    private
    def call_aliyun_with_parameter(method, params)
      params = gen_request_parameters method, params
      uri = URI(endpoint_url)

      uri.query = URI.encode_www_form(params)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == "https")

      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      if $DEBUG
        puts "Request URI: #{uri.request_uri}"
      end

      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)

      case response
      when Net::HTTPSuccess
        return JSON.parse(response.body)
      else
        raise AliyunAPIException.new "Response code: #{response.code}, message: #{response.body}"
      end
    end

    #generate the parameters
    def gen_request_parameters method, params
      #add common parameters
      params.merge! self.service.default_parameters

      params.merge! self.options

      params[:Action] = method.to_s
      params[:Timestamp] = Time.now.utc.iso8601
      params[:SignatureNonce] = SecureRandom.uuid
      params[:Signature] = compute_signature params

      params
    end

    #compute the signature of the parameters String
    def compute_signature params
      if $DEBUG
        puts "keys before sorted: #{params.keys}"
      end

      sorted_keys = params.keys.sort

      if $DEBUG
        puts "keys after sorted: #{sorted_keys}"
      end

      canonicalized_query_string = ""

      canonicalized_query_string = sorted_keys.map {|key|
        "%s=%s" % [safe_encode(key.to_s), safe_encode(params[key])]
      }.join(self.service.separator)

      length = canonicalized_query_string.length

      string_to_sign = self.service.http_method + self.service.separator + safe_encode('/') + self.service.separator + safe_encode(canonicalized_query_string)

      if $DEBUG
        puts "string_to_sign is #{string_to_sign}"
      end

      signature = calculate_signature access_key_secret+"&", string_to_sign
    end

    #calculate the signature
    def calculate_signature key, string_to_sign
      hmac = HMAC::SHA1.new(key)
      hmac.update(string_to_sign)
      signature = Base64.encode64(hmac.digest).gsub("\n", '')
      if $DEBUG
        puts "Signature #{signature}"
      end
      signature
    end

    #encode the value to aliyun's requirement
    def safe_encode value
      value = URI.encode_www_form_component(value).gsub(/\+/,'%20').gsub(/\*/,'%2A').gsub(/%7E/,'~')
    end
  end
end

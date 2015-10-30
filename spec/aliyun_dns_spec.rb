require 'spec_helper'

describe Aliyun do
  it 'can create aliyun dns service' do
    options = load_options
    options[:service] = :dns
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::DNSConfig)
  end

  it 'can query aliyun dns service for domains' do
    options = load_options
    options[:service] = :dns
    service = Aliyun::Service.new options
    parameters = {}
    dns_service = service.DescribeDomains parameters
    puts dns_service

    expect(dns_service).to have_key("Domains")
    expect(dns_service).to have_key("TotalCount")
  end
end

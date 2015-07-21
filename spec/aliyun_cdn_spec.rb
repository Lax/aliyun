require 'spec_helper'

describe Aliyun do
  it 'can create aliyun cdn service' do
    options = load_options
    options[:service] = :cdn
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::CDNConfig)
  end

  it 'can query aliyun cdn service' do
    options = load_options
    options[:service] = :cdn
    service = Aliyun::Service.new options
    parameters = {}
    cdn_service = service.DescribeCdnService parameters

    expect(cdn_service).to have_key("InternetChargeType")
    expect(cdn_service).to have_key("OpeningTime")
  end
end

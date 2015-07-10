require 'spec_helper'

describe Aliyun do
  it 'has a version number' do
    expect(Aliyun::VERSION).not_to be nil
  end

  it 'can load options' do
    option = load_options

    expect(option).to have_key(:access_key_id)
    expect(option).to have_key(:access_key_secret)
  end

  it 'can create aliyun ecs service' do
    options = load_options
    options[:service] = :ecs
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::ECSConfig)
  end

  it 'can create aliyun slb service' do
    options = load_options
    options[:service] = :slb
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::SLBConfig)
  end

  it 'can create aliyun rds service' do
    options = load_options
    options[:service] = :rds
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::RDSConfig)
  end

  it 'can create aliyun cdn service' do
    options = load_options
    options[:service] = :cdn
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::CDNConfig)
  end

  it 'can query aliyun ecs regions' do
    options = load_options
    options[:service] = :ecs
    service = Aliyun::Service.new options
    parameters = {}
    regions = service.DescribeRegions parameters

    expect(regions).to have_key("Regions")
    expect(regions["Regions"]).to have_key("Region")
  end

  it 'can query aliyun slb regions' do
    options = load_options
    options[:service] = :slb
    service = Aliyun::Service.new options
    parameters = {}
    regions = service.DescribeRegions parameters

    expect(regions).to have_key("Regions")
    expect(regions["Regions"]).to have_key("Region")
  end

  it 'can query aliyun rds regions' do
    options = load_options
    options[:service] = :rds
    service = Aliyun::Service.new options
    parameters = {}
    regions = service.DescribeRegions parameters

    expect(regions).to have_key("Regions")
    expect(regions["Regions"]).to have_key("RDSRegion")
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

  it "can describe aliyun slb regions" do
    options = load_options
    options[:service] = :slb
    service = Aliyun::Service.new options
    parameters = {}
    slbs = service.DescribeLoadBalancers :RegionId => "cn-beijing"

    expect(slbs).to have_key("LoadBalancers")
    #expect(slbs["LoadBalancers"]).to have_key("LoadBalancer")
  end
end

require 'spec_helper'

describe Aliyun do
  it 'can create aliyun ecs service' do
    options = load_options
    options[:service] = :ecs
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::ECSConfig)
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
end

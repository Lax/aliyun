require 'spec_helper'

describe Aliyun do
  it 'can create aliyun rds service' do
    options = load_options
    options[:service] = :rds
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::RDSConfig)
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
end

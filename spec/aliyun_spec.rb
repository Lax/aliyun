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
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
  end

  it 'can query aliyun regions' do
    options = load_options
    options["service"] = "ecs"
    service = Aliyun::Service.new options
    parameters = {}
    regions = service.DescribeRegions parameters

    expect(regions).to have_key("Regions")
    expect(regions["Regions"]).to have_key("Region")
  end
end

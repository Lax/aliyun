require 'spec_helper'

describe Aliyun do
  it 'can create aliyun vpc service' do
    options = load_options
    options[:service] = :vpc
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::VPCConfig)
  end
end

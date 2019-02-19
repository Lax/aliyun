require 'spec_helper'

describe Aliyun do
  it 'can create aliyun business service' do
    options = load_options
    options[:service] = :business
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::BusinessConfig)
  end
end

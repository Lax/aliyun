require 'spec_helper'

describe Aliyun do
  it 'can create aliyun CMS(metrics) service' do
    options = load_options
    options[:service] = :cms
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::CMSConfig)
  end
end

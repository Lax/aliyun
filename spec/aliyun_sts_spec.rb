require 'spec_helper'

describe Aliyun do
  it 'can create aliyun sts service' do
    options = load_options
    options[:service] = :sts
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::STSConfig)
  end

#  TODO: define a test policy
#  it 'can get aliyun sts token' do
#    options = load_options
#    options[:service] = :sts
#    service = Aliyun::Service.new options
#    parameters = {:StsVersion => 1, :Name => "aliyun_gem_t#{Time.now.to_i}", :Policy => "", :DurationSeconds => 900}
#    sts_token = service.GetFederationToken parameters
#
#    expect(sts_token).to have_key("Credentials")
#    expect(sts_token).to have_key("FederatedUser")
#  end
end

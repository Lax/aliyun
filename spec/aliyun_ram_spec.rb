require 'spec_helper'

describe Aliyun do
  it 'can create aliyun ram service' do
    options = load_options
    options[:service] = :ram
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::RAMConfig)
  end

#  it 'can list aliyun ram users' do
#    options = load_options
#    options[:service] = :ram
#    service = Aliyun::Service.new options
#    parameters = {}
#    users = service.ListUsers parameters
#
#    expect(users).to have_key("Users")
#    expect(users["Users"]).to have_key("User")
#  end
end

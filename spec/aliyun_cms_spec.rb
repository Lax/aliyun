require 'spec_helper'

describe Aliyun do
  before do
    options = load_options
    options[:service] = :cms
    options[:endpoint_url] = 'http://metrics.cn-beijing.aliyuncs.com/'
    @service = Aliyun::Service.new options
  end

  it 'can create aliyun CMS(metrics) service' do
    expect(@service).to be_instance_of(Aliyun::Service)
    expect(@service.service).to be(Aliyun::CMSConfig)
  end

  it 'can describe metric datum' do
    instanceId = load_ecs_instance_id
    instanceRegion = load_ecs_instance_region
    parameters = {
      Project: 'acs_ecs_dashboard',
      Metric: 'diskusage_utilization',
      StartTime: (Time.now - 180).utc.iso8601,
      Dimensions: "{instanceId:'%s',device:'/dev/xvda1'}" % instanceId,
      RegionId: instanceRegion,
      Length: 1000
    }
    metric_datum = @service.QueryMetricList parameters

    expect(metric_datum).to have_key("Datapoints")
    expect(metric_datum["Datapoints"][0]).to have_key("diskname")
  end
end

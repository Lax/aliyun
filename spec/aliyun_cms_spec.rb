require 'spec_helper'

describe Aliyun do
  it 'can create aliyun CMS(metrics) service' do
    options = load_options
    options[:service] = :cms
    service = Aliyun::Service.new options

    expect(service).to be_instance_of(Aliyun::Service)
    expect(service.service).to be(Aliyun::CMSConfig)
  end

  it 'can describe metric datum' do
    options = load_options
    options[:service] = :cms
    service = Aliyun::Service.new options
    instanceId = load_ecs_instance_id
    instanceRegion = load_ecs_instance_region
    parameters = {
      Namespace: 'acs/ecs',
      MetricName: 'vm.DiskUtilization',
      StartTime: (Time.now - 180).utc.iso8601,
      Dimensions: "{instanceId:'%s',mountpoint:'/'}" % instanceId,
      RegionId: instanceRegion,
      Length: 1000
    }
    metric_datum = service.DescribeMetricDatum parameters

    expect(metric_datum).to have_key("Datapoints")
    expect(metric_datum["Datapoints"]).to have_key("Datapoint")
  end
end

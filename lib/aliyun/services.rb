require "aliyun/services/ecs"
require "aliyun/services/slb"
require "aliyun/services/rds"
require "aliyun/services/cdn"
require "aliyun/services/ram"
require "aliyun/services/sts"

module Aliyun
  SERVICES = {
    :ecs => ECSConfig,
    :slb => SLBConfig,
    :rds => RDSConfig,
    :cdn => CDNConfig,
    :ram => RAMConfig,
    :sts => STSConfig
  }
end

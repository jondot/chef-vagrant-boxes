
name "graphite_statsd"
description "Graphite and StatsD"
run_list "recipe[apt]",
		 "recipe[memcached]",
		 "recipe[graphite]",
		 "recipe[statsd]"
		 
require 'yaml'


override_attributes YAML.load <<EOF

graphite:
  storage_schemas:
    - stats:
        priority: "100"
        pattern: ^stats.*
        retentions: "10s:7d,1m:31d,10m:5y"
  
    - catchall:
        priority: "0"
        pattern: ^.*
        retentions: "60s:5y"

  storage_aggregation:
    - min:
        pattern: \\.lower$
        xFilesFactor: "0.1"
        aggregationMethod: min

    - max:
        pattern: \\.upper$
        xFilesFactor: "0.1"
        aggregationMethod: max

    - sum:
        pattern: \\.sum$
        xFilesFactor: "0"
        aggregationMethod: sum

    - count:
        pattern: \\.count$
        xFilesFactor: "0"
        aggregationMethod: sum

    - count_legacy:
        pattern: ^stats_counts.*
        xFilesFactor: "0"
        aggregationMethod: sum

    - default_average:
        pattern: .*
        xFilesFactor: "0.3"
        aggregationMethod: average      
EOF

name "graphite_statsd"
description "Graphite and StatsD"
run_list "recipe[apt]",
		 "recipe[python]",
		 "recipe[git]",
		 "recipe[graphite]",
		 "recipe[statsd]"
		 
require 'yaml'


override_attributes YAML.load <<EOF

graphite:
  python_version: 2.7
  web:
    password: 123123
python:
  pip:
    prefix_dir: /usr

EOF

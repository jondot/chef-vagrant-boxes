
name "appserver"
description "Base appserver"
run_list "recipe[apt]",
		 "recipe[git]",
		 "recipe[redis::source]"
		 

require 'yaml'
override_attributes YAML.load <<EOF

redis:
  source:
    version: 2.4.15




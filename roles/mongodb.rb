name "mongodb"
description "Standalone mongodb + redis server"
run_list "recipe[apt]",
		 "recipe[git]",
		 "recipe[redis::source]",
		 "recipe[mongodb::10gen_repo]"

		 

require 'yaml'
override_attributes YAML.load <<EOF

redis:
  source:
    version: 2.4.15
  bind: 0.0.0.0

EOF



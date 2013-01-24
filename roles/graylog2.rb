name "graylog2"
description "Dedicated graylog2 log server"
run_list "recipe[java]",
         "recipe[graylog2::server]",
         "recipe[graylog2::apache2]"





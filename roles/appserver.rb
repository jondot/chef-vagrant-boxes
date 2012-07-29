name "appserver"
description "Base appserver"
run_list "recipe[apt]",
		 "recipe[git]",
		 "recipe[java]",
		 "recipe[imagemagick]",
		 "recipe[ruby_build]", 
		 "recipe[rbenv::system]", 
		 "recipe[nodejs]",
		 "recipe[nodejs-support]",
		 "recipe[nginx]"
		 
override_attributes({
  'rbenv' => {
	'rubies' => [ "1.9.3-p194", "jruby-1.6.7.2" ],
	'gems'   => {
		"1.9.3-p194" => [
			{'name'=> 'bundler', 'version'=>'1.1.4'}
		],
		"jruby-1.6.7.2" => [
			{'name'=>'bundler', 'version'=>'1.1.4'},
			{'name'=>'jruby-openssl', 'version'=>'0.7.7'}
		]
	}
  },
  
  'java' => {
	'jdk_version' => '7'
  }
})


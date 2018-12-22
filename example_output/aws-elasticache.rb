name :
	 AwsElasticache
homepage :
	 https://aws.amazon.com/developertools/2310261897259567
url :
	 https://s3.amazonaws.com/elasticache-downloads/AmazonElastiCacheCli-2014-09-30-1.12.000.zip
description :
	 Client for Amazon ElastiCache web service
build_deps :
link_deps :
	 ec2-api-tools
	 :java
conflicts :
patches :
EOF_patch :
install :
	 env = Language::Java.java_home_env.merge(:AWS_ELASTICACHE_HOME => libexec)
	 rm Dir["bin/*.cmd"]
	 libexec.install Dir["*"]
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 next if file.directory?
	 basename = file.basename
	 next if basename.to_s == "service"
	 (bin/basename).write_env_script file, env
	 end

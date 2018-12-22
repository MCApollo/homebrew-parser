name :
	 ElbTools
homepage :
	 https://aws.amazon.com/developertools/2536
url :
	 https://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.zip
description :
	 Client interface to the Amazon Elastic Load Balancing web service
build_deps :
link_deps :
	 ec2-api-tools
	 :java
conflicts :
patches :
EOF_patch :
install :
	 env = Language::Java.java_home_env.merge(:AWS_ELB_HOME => libexec)
	 rm Dir["bin/*.cmd"]
	 libexec.install Dir["*"]
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 next if file.directory?
	 basename = file.basename
	 next if basename.to_s == "service"
	 (bin/basename).write_env_script file, env
	 end

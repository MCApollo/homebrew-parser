name :
	 AwsCfnTools
homepage :
	 https://aws.amazon.com/developertools/AWS-CloudFormation/2555753788650372
url :
	 https://s3.amazonaws.com/cloudformation-cli/AWSCloudFormation-cli.zip
description :
	 Client for Amazon CloudFormation web service
build_deps :
link_deps :
	 ec2-api-tools
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 env = Language::Java.java_home_env.merge(:AWS_CLOUDFORMATION_HOME => libexec)
	 rm Dir["bin/*.cmd"]
	 libexec.install Dir["*"]
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 next if file.directory?
	 basename = file.basename
	 next if basename.to_s == "service"
	 (bin/basename).write_env_script file, env
	 end

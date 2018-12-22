name :
	 Ec2AmiTools
homepage :
	 https://aws.amazon.com/developertools/368
url :
	 https://ec2-downloads.s3.amazonaws.com/ec2-ami-tools-1.5.7.zip
description :
	 Amazon EC2 AMI Tools (helps bundle Amazon Machine Images)
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 env = Language::Java.java_home_env.merge(:EC2_AMITOOL_HOME => libexec)
	 rm Dir["bin/*.cmd"]
	 libexec.install Dir["*"]
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 next if file.directory?
	 basename = file.basename
	 next if basename.to_s == "service"
	 (bin/basename).write_env_script file, env
	 end

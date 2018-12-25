name :
	 Ec2ApiTools
homepage :
	 https://aws.amazon.com/developertools/351
url :
	 https://ec2-downloads.s3.amazonaws.com/ec2-api-tools-1.7.5.1.zip
description :
	 Client interface to the Amazon EC2 web service
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 env = Language::Java.java_home_env.merge(:EC2_HOME => libexec)
	 rm Dir["bin/*.cmd"]
	 libexec.install Dir["*"]
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 next if file.directory?
	 basename = file.basename
	 next if basename.to_s == "service"
	 (bin/basename).write_env_script file, env
	 end

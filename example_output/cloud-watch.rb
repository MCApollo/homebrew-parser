name :
	 CloudWatch
homepage :
	 https://aws.amazon.com/developertools/2534
url :
	 https://ec2-downloads.s3.amazonaws.com/CloudWatch-2010-08-01.zip
description :
	 Amazon CloudWatch command-line Tool
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
	 env = Language::Java.java_home_env
	 env[:AWS_CLOUDWATCH_HOME] = libexec
	 env[:SERVICE_HOME] = libexec
	 rm Dir["bin/*.cmd"]
	 libexec.install Dir["*"]
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 next if file.directory?
	 basename = file.basename
	 next if basename.to_s == "service"
	 (bin/basename).write_env_script file, env
	 end

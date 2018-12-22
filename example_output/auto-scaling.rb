name :
	 AutoScaling
homepage :
	 https://aws.amazon.com/developertools/2535
url :
	 https://ec2-downloads.s3.amazonaws.com/AutoScaling-2011-01-01.zip
description :
	 Client interface to the Amazon Auto Scaling web service
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 env = Language::Java.java_home_env.merge(:AWS_AUTO_SCALING_HOME => libexec)
	 rm Dir["bin/*.cmd"]
	 libexec.install Dir["*"]
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 next if file.directory?
	 basename = file.basename
	 next if basename.to_s == "service"
	 (bin/basename).write_env_script file, env
	 end

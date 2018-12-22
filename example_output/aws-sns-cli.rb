name :
	 AwsSnsCli
homepage :
	 https://aws.amazon.com/developertools/3688
url :
	 https://sns-public-resources.s3.amazonaws.com/SimpleNotificationServiceCli-2010-03-31.zip
description :
	 Client for Amazon Simple Notification web service
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 env = Language::Java.java_home_env.merge(:AWS_SNS_HOME => libexec)
	 rm Dir["bin/*.cmd"]
	 chmod 0755, Dir["bin/*"]
	 libexec.install Dir["*"]
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 next if file.directory?
	 basename = file.basename
	 next if basename.to_s == "service"
	 (bin/basename).write_env_script file, env
	 end

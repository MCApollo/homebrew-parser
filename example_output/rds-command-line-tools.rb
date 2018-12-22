name :
	 RdsCommandLineTools
homepage :
	 https://aws.amazon.com/developertools/2928
url :
	 https://s3.amazonaws.com/rds-downloads/RDSCli-1.19.004.zip
description :
	 Amazon RDS command-line toolkit
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 env = Language::Java.java_home_env.merge(:AWS_RDS_HOME => libexec)
	 rm Dir["bin/*.cmd"]
	 etc.install "credential-file-path.template"
	 libexec.install Dir["*"]
	 Pathname.glob("#{libexec}/bin/*") do |file|
	 next if file.directory?
	 basename = file.basename
	 next if basename.to_s == "service"
	 (bin/basename).write_env_script file, env
	 end

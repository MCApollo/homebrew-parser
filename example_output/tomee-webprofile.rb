name :
	 TomeeWebprofile
homepage :
	 https://tomee.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=tomee/tomee-1.7.5/apache-tomee-1.7.5-webprofile.tar.gz
description :
	 All-Apache Java EE 6 Web Profile stack
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
	 rm_rf Dir["bin/*.bat"]
	 rm_rf Dir["bin/*.bat.original"]
	 rm_rf Dir["bin/*.exe"]
	 prefix.install %w[NOTICE LICENSE RELEASE-NOTES RUNNING.txt]
	 libexec.install Dir["*"]
	 libexec.install_symlink "#{libexec}/bin/startup.sh" => "tomee-webprofile-startup"
	 env = Language::Java.java_home_env("1.8")
	 env[:JRE_HOME] = "$(#{Language::Java.java_home_cmd("1.8")})"
	 (bin/"tomee-webprofile-startup").write_env_script libexec/"tomee-webprofile-startup", env
	 (bin/"tomee-webprofile-configtest").write_env_script libexec/"bin/configtest.sh", env

name :
	 Gosu
homepage :
	 https://gosu-lang.github.io/
url :
	 https://github.com/gosu-lang/gosu-lang/archive/v1.14.12.tar.gz
description :
	 Pragmatic language for the JVM
build_deps :
	 maven
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
	 cmd = Language::Java.java_home_cmd("1.8")
	 ENV["JAVA_HOME"] = Utils.popen_read(cmd).chomp
	 system "mvn", "package"
	 libexec.install Dir["gosu/target/gosu-#{version}-full/gosu-#{version}/*"]
	 (libexec/"ext").mkpath
	 (bin/"gosu").write_env_script libexec/"bin/gosu", Language::Java.java_home_env("1.8")

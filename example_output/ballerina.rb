name :
	 Ballerina
homepage :
	 https://ballerina.io/
url :
	 https://product-dist.ballerina.io/downloads/0.990.0/ballerina-0.990.0.zip
description :
	 The flexible, powerful and beautiful programming language
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm Dir["bin/*.bat"]
	 chmod 0755, "bin/ballerina"
	 inreplace ["bin/ballerina"] do |s|
	 s.gsub! /^BALLERINA_HOME=.*$/, "BALLERINA_HOME=#{libexec}"
	 s.gsub! /\r?/, ""
	 end
	 bin.install "bin/ballerina"
	 libexec.install Dir["*"]
	 prefix.install_symlink libexec/"bre"
	 prefix.install_symlink libexec/"lib"
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))

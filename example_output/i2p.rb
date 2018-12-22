name :
	 I2p
homepage :
	 https://geti2p.net
url :
	 https://download.i2p2.de/releases/0.9.37/i2pinstall_0.9.37.jar
description :
	 Anonymous overlay network - a network within a network
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"path.conf").write "INSTALL_PATH=#{libexec}"
	 system "java", "-jar", "i2pinstall_#{version}.jar", "-options", "path.conf"
	 wrapper_name = "i2psvc-macosx-universal-#{MacOS.prefer_64_bit? ? 64 : 32}"
	 libexec.install_symlink libexec/wrapper_name => "i2psvc"
	 bin.write_exec_script Dir["#{libexec}/{eepget,i2prouter}"]
	 man1.install Dir["#{libexec}/man/*"]

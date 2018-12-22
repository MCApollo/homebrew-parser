name :
	 Umlet
homepage :
	 https://www.umlet.com/
url :
	 https://www.umlet.com/umlet_14_2/umlet-standalone-14.2.zip
description :
	 This UML tool aimed at providing a fast way of creating UML diagrams
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm Dir["*.{desktop,exe}"]
	 libexec.install Dir["*"]
	 inreplace "#{libexec}/umlet.sh", " java ", " ${JAVA_HOME}/bin/java "
	 inreplace "#{libexec}/umlet.sh", /^programDir=.*$/,
	 "programDir=#{libexec}"
	 chmod 0755, "#{libexec}/umlet.sh"
	 (bin/"umlet-#{version}").write_env_script "#{libexec}/umlet.sh",
	 Language::Java.java_home_env("1.6+")
	 bin.install_symlink "umlet-#{version}" => "umlet"

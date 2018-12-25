name :
	 Derby
homepage :
	 https://db.apache.org/derby/
url :
	 https://www.apache.org/dyn/closer.cgi?path=db/derby/db-derby-10.14.2.0/db-derby-10.14.2.0-bin.tar.gz
description :
	 Apache Derby is an embedded relational database running on JVM
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
	 libexec.install %w[lib test index.html LICENSE NOTICE RELEASE-NOTES.html
	 KEYS docs javadoc demo]
	 bin.install Dir["bin/*"]
	 bin.env_script_all_files(libexec/"bin",
	 Language::Java.overridable_java_home_env.merge(:DERBY_INSTALL => libexec.to_s,
	 :DERBY_HOME    => libexec.to_s))
	 end
	 def post_install
	 (var/"derby").mkpath

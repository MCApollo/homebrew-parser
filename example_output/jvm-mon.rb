name :
	 JvmMon
homepage :
	 https://github.com/ajermakovics/jvm-mon
url :
	 https://github.com/ajermakovics/jvm-mon/releases/download/0.3/jvm-mon-0.3.tar.gz
description :
	 Console-based JVM monitoring
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 (bin/"jvm-mon").write_env_script "#{libexec}/bin/jvm-mon",
	 Language::Java.java_home_env("1.8")
	 system "unzip", "-j", libexec/"lib/j2v8_macosx_x86_64-4.6.0.jar", "libj2v8_macosx_x86_64.dylib", "-d", libexec

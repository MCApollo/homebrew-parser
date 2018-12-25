name :
	 Jvmtop
homepage :
	 https://github.com/patric-r/jvmtop
url :
	 https://github.com/patric-r/jvmtop/releases/download/0.8.0/jvmtop-0.8.0.tar.gz
description :
	 Console application for monitoring all running JVMs on a machine
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
	 rm Dir["*.bat"]
	 mv "jvmtop.sh", "jvmtop"
	 chmod 0755, "jvmtop"
	 libexec.install Dir["*"]
	 (bin/"jvmtop").write_env_script(libexec/"jvmtop", Language::Java.java_home_env)

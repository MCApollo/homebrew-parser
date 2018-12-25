name :
	 Bee
homepage :
	 https://github.com/bluesoft/bee
url :
	 https://github.com/bluesoft/bee/releases/download/1.63/bee-1.63.zip
description :
	 Tool for managing database changes
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
	 libexec.install Dir["*"]
	 (bin/"bee").write_env_script libexec/"bin/bee", Language::Java.java_home_env("1.8")

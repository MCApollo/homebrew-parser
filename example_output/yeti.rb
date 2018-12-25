name :
	 Yeti
homepage :
	 https://mth.github.io/yeti/
url :
	 https://github.com/mth/yeti/archive/v0.9.9.1.tar.gz
description :
	 ML-style functional programming language that runs on the JVM
build_deps :
	 ant
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
	 system "ant", "jar"
	 libexec.install "yeti.jar"
	 bin.write_jar_script libexec/"yeti.jar", "yeti", "-server"

name :
	 Pmd
homepage :
	 https://pmd.github.io
url :
	 https://github.com/pmd/pmd/releases/download/pmd_releases/6.10.0/pmd-bin-6.10.0.zip
description :
	 Source code analyzer for Java, JavaScript, and more
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 (bin/"pmd").write_env_script libexec/"bin/run.sh",
	 Language::Java.java_home_env("1.8+")

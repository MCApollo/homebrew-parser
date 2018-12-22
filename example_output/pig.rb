name :
	 Pig
homepage :
	 https://pig.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=pig/pig-0.17.0/pig-0.17.0.tar.gz
description :
	 Platform for analyzing large data sets
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 (libexec/"bin").install "bin/pig"
	 libexec.install Dir["pig-#{version}-core-h*.jar"]
	 libexec.install "lib"
	 (bin/"pig").write_env_script libexec/"bin/pig", Language::Java.java_home_env("1.6+").merge(:PIG_HOME => libexec)

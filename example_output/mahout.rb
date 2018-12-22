name :
	 Mahout
homepage :
	 https://mahout.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=mahout/0.13.0/apache-mahout-distribution-0.13.0.tar.gz
description :
	 Library to help build scalable machine learning libraries
build_deps :
link_deps :
	 hadoop
	 :java
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 chmod 755, "./bin"
	 system "mvn", "-DskipTests", "clean", "install"

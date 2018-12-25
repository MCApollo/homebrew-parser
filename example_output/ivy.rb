name :
	 Ivy
homepage :
	 https://ant.apache.org/ivy/
url :
	 https://www.apache.org/dyn/closer.cgi?path=ant/ivy/2.4.0/apache-ivy-2.4.0-bin.tar.gz
description :
	 Agile dependency manager
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install Dir["ivy*"]
	 doc.install Dir["doc/*"]
	 bin.write_jar_script libexec/"ivy-#{version}.jar", "ivy", "$JAVA_OPTS"

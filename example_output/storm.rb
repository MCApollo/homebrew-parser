name :
	 Storm
homepage :
	 https://storm.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=storm/apache-storm-1.2.2/apache-storm-1.2.2.tar.gz
description :
	 Distributed realtime computation system to process data streams
build_deps :
link_deps :
optional_deps :
conflicts :
	 stormssh
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"bin/storm"

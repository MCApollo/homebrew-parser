name :
	 AntContrib
homepage :
	 https://ant-contrib.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ant-contrib/ant-contrib/1.0b3/ant-contrib-1.0b3-bin.tar.gz
description :
	 Collection of tasks for Apache Ant
build_deps :
link_deps :
	 ant
conflicts :
patches :
EOF_patch :
install :
	 (share+"ant").install "ant-contrib-1.0b3.jar"
	 share.install "docs"

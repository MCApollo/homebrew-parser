name :
	 Ioping
homepage :
	 https://github.com/koct9i/ioping
url :
	 https://github.com/koct9i/ioping/archive/v1.1.tar.gz
description :
	 Tool to monitor I/O latency in real time
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
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}"

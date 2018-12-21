name :
	 Httpflow
homepage :
	 https://github.com/six-ddc/httpflow
url :
	 https://github.com/six-ddc/httpflow/archive/0.0.7.tar.gz
description :
	 Packet capture and analysis utility similar to tcpdump for HTTP
build_deps :
link_deps :
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}", "CXX=#{ENV.cxx}"

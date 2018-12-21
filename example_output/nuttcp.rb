name :
	 Nuttcp
homepage :
	 https://www.nuttcp.net/nuttcp
url :
	 https://www.nuttcp.net/nuttcp/nuttcp-8.1.4.tar.bz2
description :
	 Network performance measurement tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "APP=nuttcp",
	 "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
	 bin.install "nuttcp"
	 man8.install "nuttcp.cat" => "nuttcp.8"

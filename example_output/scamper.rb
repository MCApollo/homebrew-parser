name :
	 Scamper
homepage :
	 https://www.caida.org/tools/measurement/scamper/
url :
	 https://www.caida.org/tools/measurement/scamper/code/scamper-cvs-20180504.tar.gz
description :
	 Advanced traceroute and network measurement utility
build_deps :
	 pkg-config
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"

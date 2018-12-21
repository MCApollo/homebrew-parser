name :
	 ArgusClients
homepage :
	 https://qosient.com/argus/
url :
	 https://qosient.com/argus/src/argus-clients-3.0.8.2.tar.gz
description :
	 Audit Record Generation and Utilization System clients
build_deps :
link_deps :
	 readline
	 rrdtool
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CFLAGS", "-std=gnu89"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"

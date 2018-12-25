name :
	 Argus
homepage :
	 https://qosient.com/argus/
url :
	 https://qosient.com/argus/src/argus-3.0.8.2.tar.gz
description :
	 Audit Record Generation and Utilization System server
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"

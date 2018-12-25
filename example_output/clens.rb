name :
	 Clens
homepage :
	 https://github.com/conformal/clens
url :
	 https://github.com/conformal/clens/archive/CLENS_0_7_0.tar.gz
description :
	 Library to help port code from OpenBSD to other operating systems
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/conformal/clens/commit/83648cc9027d9f76a1bc79ddddcbed1349b9d5cd.diff?full_index=1
EOF_patch :
install :
	 ENV.deparallelize
	 system "make", "all", "install", "LOCALBASE=#{prefix}"

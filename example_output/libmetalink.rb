name :
	 Libmetalink
homepage :
	 https://launchpad.net/libmetalink/
url :
	 https://launchpad.net/libmetalink/trunk/libmetalink-0.1.3/+download/libmetalink-0.1.3.tar.xz
description :
	 C library to parse Metalink XML files
build_deps :
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"

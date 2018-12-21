name :
	 Htop
homepage :
	 https://hisham.hm/htop/
url :
	 https://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz
description :
	 Improved top (interactive process viewer)
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"

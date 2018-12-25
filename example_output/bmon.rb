name :
	 Bmon
homepage :
	 https://github.com/tgraf/bmon
url :
	 https://github.com/tgraf/bmon/releases/download/v4.0/bmon-4.0.tar.gz
description :
	 Interface bandwidth monitor
build_deps :
	 pkg-config
link_deps :
	 confuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"

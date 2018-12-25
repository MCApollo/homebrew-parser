name :
	 Axel
homepage :
	 https://github.com/eribertomota/axel
url :
	 https://github.com/axel-download-accelerator/axel/archive/v2.15.tar.gz
description :
	 Light UNIX download accelerator
build_deps :
	 autoconf
	 automake
link_deps :
	 gettext
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}"
	 system "make", "install"

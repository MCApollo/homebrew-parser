name :
	 IsoCodes
homepage :
	 https://salsa.debian.org/iso-codes-team/iso-codes
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/i/iso-codes/iso-codes_4.1.orig.tar.xz
description :
	 Provides lists of various ISO standards
build_deps :
	 gettext
link_deps :
	 pkg-config
	 python
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
	 system "make", "check"
	 system "make", "install"

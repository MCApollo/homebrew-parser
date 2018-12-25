name :
	 Uudeview
homepage :
	 http://www.fpx.de/fp/Software/UUDeview/
url :
	 http://www.fpx.de/fp/Software/UUDeview/download/uudeview-0.5.20.tar.gz
description :
	 Smart multi-file multi-part decoder
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/19da78c/uudeview/inews.c.patch
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--disable-tcl"
	 system "make", "install"
	 lib.install "uulib/libuu.a"
	 include.install "uulib/uudeview.h"

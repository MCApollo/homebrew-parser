name :
	 OpencoreAmr
homepage :
	 https://opencore-amr.sourceforge.io/
url :
	 https://downloads.sourceforge.net/opencore-amr/opencore-amr-0.1.5.tar.gz
description :
	 Audio codecs extracted from Android open source project
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
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"

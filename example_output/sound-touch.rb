name :
	 SoundTouch
homepage :
	 https://www.surina.net/soundtouch/
url :
	 https://www.surina.net/soundtouch/soundtouch-2.0.0.tar.gz
description :
	 Audio processing library
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "/bin/sh", "bootstrap"
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 ]
	 system "./configure", *args
	 system "make", "install"

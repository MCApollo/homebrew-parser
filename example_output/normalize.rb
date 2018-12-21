name :
	 Normalize
homepage :
	 https://www.nongnu.org/normalize/
url :
	 https://savannah.nongnu.org/download/normalize/normalize-0.7.7.tar.gz
description :
	 Adjust volume of audio files to a standard level
build_deps :
link_deps :
	 mad
conflicts :
	 num-utils
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --mandir=#{man}
	 ]
	 system "./configure", *args
	 system "make", "install"

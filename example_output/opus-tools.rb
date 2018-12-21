name :
	 OpusTools
homepage :
	 https://www.opus-codec.org
url :
	 https://archive.mozilla.org/pub/opus/opus-tools-0.2.tar.gz
description :
	 Utilities to encode, inspect, and decode .opus files
build_deps :
	 pkg-config
link_deps :
	 flac
	 libogg
	 libopusenc
	 opus
	 opusfile
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"

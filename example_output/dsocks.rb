name :
	 Dsocks
homepage :
	 https://monkey.org/~dugsong/dsocks/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/dsocks/dsocks-1.8.tar.gz
description :
	 SOCKS client wrapper for *BSD/macOS
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
	 system ENV.cc, ENV.cflags, "-shared", "-o", "libdsocks.dylib", "dsocks.c",
	 "atomicio.c", "-lresolv"
	 inreplace "dsocks.sh", "/usr/local", HOMEBREW_PREFIX
	 lib.install "libdsocks.dylib"
	 bin.install "dsocks.sh"

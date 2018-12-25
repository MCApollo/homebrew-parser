name :
	 Wiggle
homepage :
	 https://neil.brown.name/blog/20100324064620
url :
	 https://neil.brown.name/wiggle/wiggle-1.1.tar.gz
description :
	 Program for applying patches with conflicting changes
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
	 system "make", "OptDbg=#{ENV.cflags}", "wiggle", "wiggle.man", "test"
	 bin.install "wiggle"
	 man1.install "wiggle.1"

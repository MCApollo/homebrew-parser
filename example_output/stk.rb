name :
	 Stk
homepage :
	 https://ccrma.stanford.edu/software/stk/
url :
	 https://ccrma.stanford.edu/software/stk/release/stk-4.6.0.tar.gz
description :
	 Sound Synthesis Toolkit
build_deps :
	 autoconf
	 automake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--prefix=#{prefix}", "--disable-debug"
	 system "make"
	 lib.install "src/libstk.a"
	 bin.install "bin/treesed"
	 (include/"stk").install Dir["include/*"]
	 doc.install Dir["doc/*"]
	 pkgshare.install "src", "projects", "rawwaves"

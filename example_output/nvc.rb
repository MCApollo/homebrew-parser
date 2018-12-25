name :
	 Nvc
homepage :
	 https://github.com/nickg/nvc
url :
	 https://github.com/nickg/nvc/releases/download/r1.4.0/nvc-1.4.0.tar.gz
description :
	 VHDL compiler and simulator
build_deps :
	 check
	 llvm
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 ['vim-hdl-examples']
	 ['https://github.com/suoto/vim-hdl-examples.git']
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./tools/fetch-ieee.sh"
	 system "./configure", "--with-llvm=#{Formula["llvm"].opt_bin}/llvm-config",
	 "--prefix=#{prefix}",
	 "--with-system-cc=/usr/bin/clang"
	 system "make"
	 system "make", "install"

name :
	 Zshdb
homepage :
	 https://github.com/rocky/zshdb
url :
	 https://downloads.sourceforge.net/project/bashdb/zshdb/0.92/zshdb-0.92.tar.bz2
description :
	 Debugger for zsh
build_deps :
link_deps :
	 zsh
conflicts :
patches :
	 https://github.com/rocky/zshdb/commit/94b389a3.patch?full_index=1
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-zsh=#{HOMEBREW_PREFIX}/bin/zsh"
	 system "make", "install"

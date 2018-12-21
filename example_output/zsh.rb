name :
	 Zsh
homepage :
	 https://www.zsh.org/
url :
	 https://downloads.sourceforge.net/project/zsh/zsh/5.6.2/zsh-5.6.2.tar.xz
description :
	 UNIX shell (command interpreter)
build_deps :
link_deps :
	 ncurses
conflicts :
patches :
EOF_patch :
install :
	 system "Util/preconfig" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-fndir=#{pkgshare}/functions",
	 "--enable-scriptdir=#{pkgshare}/scripts",
	 "--enable-site-fndir=#{HOMEBREW_PREFIX}/share/zsh/site-functions",
	 "--enable-site-scriptdir=#{HOMEBREW_PREFIX}/share/zsh/site-scripts",
	 "--enable-runhelpdir=#{pkgshare}/help",
	 "--enable-cap",
	 "--enable-maildir-support",
	 "--enable-multibyte",
	 "--enable-zsh-secure-free",
	 "--enable-unicode9",
	 "--enable-etcdir=/etc",
	 "--with-tcsetpgrp",
	 "DL_EXT=bundle"
	 inreplace ["Makefile", "Src/Makefile"],
	 "$(libdir)/$(tzsh)/$(VERSION)", "$(libdir)"
	 if build.head?
	 system "make", "install.bin", "install.modules", "install.fns"
	 else
	 system "make", "install"
	 system "make", "install.info"
	 resource("htmldoc").stage do
	 (pkgshare/"htmldoc").install Dir["Doc/*.html"]

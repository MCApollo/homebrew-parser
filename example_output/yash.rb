name :
	 Yash
homepage :
	 https://yash.osdn.jp/
url :
	 https://dotsrc.dl.osdn.net/osdn/yash/69353/yash-2.47.tar.xz
description :
	 Yet another shell: a POSIX-compliant command-line shell
build_deps :
link_deps :
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 system "sh", "./configure",
	 "--prefix=#{prefix}",
	 "--enable-array",
	 "--enable-dirstack",
	 "--enable-help",
	 "--enable-history",
	 "--enable-lineedit",
	 "--enable-nls",
	 "--enable-printf",
	 "--enable-socket",
	 "--enable-test",
	 "--enable-ulimit"
	 system "make", "install"

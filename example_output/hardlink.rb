name :
	 Hardlink
homepage :
	 https://jak-linux.org/projects/hardlink/
url :
	 https://jak-linux.org/projects/hardlink/hardlink_0.3.0.tar.xz
description :
	 Replace file copies using hardlinks
build_deps :
	 pkg-config
link_deps :
	 gnu-getopt
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "MANDIR=#{man}", "BINDIR=#{bin}", "install"

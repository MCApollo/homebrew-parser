name :
	 Nkf
homepage :
	 https://osdn.net/projects/nkf/
url :
	 https://dotsrc.dl.osdn.net/osdn/nkf/64158/nkf-2.1.4.tar.gz
description :
	 Network Kanji code conversion Filter (NKF)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile", "$(prefix)/man", "$(prefix)/share/man"
	 system "make", "CC=#{ENV.cc}"
	 system "make", "install", "prefix=#{prefix}", "MKDIR=mkdir -p"

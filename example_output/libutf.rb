name :
	 Libutf
homepage :
	 https://9fans.github.io/plan9port/unix/
url :
	 https://dl.bintray.com/homebrew/mirror/libutf-20110530.tgz
description :
	 Port of Plan 9's support library for UTF-8 and Unicode
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile" do |f|
	 f.gsub! "man/man7", "share/man/man7"
	 f.gsub! "Make.$(SYSNAME)-$(OBJTYPE)", "Make.Darwin-386"

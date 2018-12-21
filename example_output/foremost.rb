name :
	 Foremost
homepage :
	 https://foremost.sourceforge.io/
url :
	 https://foremost.sourceforge.io/pkg/foremost-1.5.7.tar.gz
description :
	 Console program to recover files based on their headers and footers
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile" do |s|
	 s.gsub! "/usr/", "#{prefix}/"
	 s.change_make_var! "RAW_CC", ENV.cc
	 s.change_make_var! "RAW_FLAGS", ENV.cflags

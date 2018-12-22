name :
	 Jed
homepage :
	 https://www.jedsoft.org/jed/
url :
	 https://www.jedsoft.org/releases/jed/jed-0.99-19.tar.gz
description :
	 Powerful editor for programmers
build_deps :
link_deps :
	 s-lang
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 cd "autoconf" do
	 system "make"
	 end

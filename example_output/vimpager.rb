name :
	 Vimpager
homepage :
	 https://github.com/rkitover/vimpager
url :
	 https://github.com/rkitover/vimpager/archive/2.06.tar.gz
description :
	 Use ViM as PAGER
build_deps :
link_deps :
	 pandoc
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
	 system "make", "docs" if build.with? "pandoc"

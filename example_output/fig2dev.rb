name :
	 Fig2dev
homepage :
	 https://mcj.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/mcj/fig2dev-3.2.7a.tar.xz
description :
	 Translates figures generated by xfig to other formats
build_deps :
link_deps :
	 ghostscript
	 libpng
	 netpbm
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --enable-transfig
	 ]
	 if build.with? "x11"
	 args << "--with-xpm" << "--with-x"
	 else
	 args << "--without-xpm" << "--without-x"

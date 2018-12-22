name :
	 Xdelta
homepage :
	 http://xdelta.org
url :
	 https://github.com/jmacd/xdelta/archive/v3.1.0.tar.gz
description :
	 Binary diff, differential compression tools
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 xz
conflicts :
patches :
EOF_patch :
install :
	 cd "xdelta3" do
	 system "autoreconf", "--install"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-liblzma"
	 system "make", "install"
	 end

name :
	 Less
homepage :
	 http://www.greenwoodsoftware.com/less/index.html
url :
	 https://ftp.gnu.org/gnu/less/less-530.tar.gz
description :
	 Pager program similar to more
build_deps :
link_deps :
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 args = ["--prefix=#{prefix}"]
	 args << "--with-regex=pcre" if build.with? "pcre"
	 system "./configure", *args
	 system "make", "install"

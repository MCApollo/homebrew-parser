name :
	 Discount
homepage :
	 https://www.pell.portland.or.us/~orc/Code/discount/
url :
	 https://www.pell.portland.or.us/~orc/Code/discount/discount-2.2.4.tar.bz2
description :
	 C implementation of Markdown
build_deps :
link_deps :
optional_deps :
conflicts :
	 markdown
	 multimarkdown
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --with-dl=Both
	 --enable-dl-tag
	 --enable-pandoc-header
	 --enable-superscript
	 ]
	 system "./configure.sh", *args
	 bin.mkpath
	 lib.mkpath
	 include.mkpath
	 system "make", "install.everything"

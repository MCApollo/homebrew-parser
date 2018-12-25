name :
	 Hspell
homepage :
	 http://hspell.ivrix.org.il/
url :
	 http://hspell.ivrix.org.il/hspell-1.4.tar.gz
description :
	 Free Hebrew linguistic project
build_deps :
	 autoconf
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git Makefile.in Makefile.in
	 index a400ca1..fa595e8 100644
	 --- Makefile.in
	 +++ Makefile.in
	 @@ -98,7 +98,7 @@ clean:
	 hebrew.wgz.lingsizes.tmp dmask.c \
	 spell-he.xpi he.dic he.aff README-he.txt \
	 README_he_IL.txt he_IL.dic he_IL.aff he_IL.zip \
	 -	      specfilter.o specfilter he.rws libhspell.so.0 libhspell.so \
	 +	      specfilter.o specfilter he.rws libhspell.dylib \
	 dict_radix.lo gimatria.lo corlist.lo libhspell.lo linginfo.lo \
	 he.xpi misc/dictionaries/he.dic misc/dictionaries/he.aff \
	 misc/dictionaries/license.txt misc/dictionaries/README-he.txt
	 @@ -137,9 +137,8 @@ install: all
install :
	 ENV.deparallelize
	 system "autoconf"
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-shared",
	 "--enable-linginfo"
	 system "make", "dolinginfo"
	 system "make", "install"

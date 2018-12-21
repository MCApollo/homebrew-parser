name :
	 Uniutils
homepage :
	 https://billposer.org/Software/unidesc.html
url :
	 https://billposer.org/Software/Downloads/uniutils-2.27.tar.gz
description :
	 Manipulate and analyze Unicode text
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 Description: Fix clang FTBFS [-Wreturn-type]
	 Author: Nicolas Sévelin-Radiguet <nicosr@free.fr>
	 Last-Update: 2014-03-06
	 --- a/unifuzz.c
	 +++ b/unifuzz.c
	 @@ -97,7 +97,7 @@
	 }
	 /* Emit the middle character from each range */
	 -EmitAllRanges(short AboveBMPP) {
	 +void EmitAllRanges(short AboveBMPP) {
	 int i;
	 UTF32 scp;
	 extern int Ranges_Defined;
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"

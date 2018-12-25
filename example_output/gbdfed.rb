name :
	 Gbdfed
homepage :
	 http://sofia.nmsu.edu/~mleisher/Software/gbdfed/
url :
	 http://sofia.nmsu.edu/~mleisher/Software/gbdfed/gbdfed-1.6.tar.gz
description :
	 Bitmap Font Editor
build_deps :
	 pkg-config
link_deps :
	 gtk+
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/Makefile.in b/Makefile.in
	 index b482958..10a528e 100644
	 --- a/Makefile.in
	 +++ b/Makefile.in
	 @@ -28,8 +28,7 @@ CC = @CC@
	 CFLAGS = @XX_CFLAGS@ @CFLAGS@
	 DEFINES = @DEFINES@ -DG_DISABLE_DEPRECATED \
	 -	-DGDK_DISABLE_DEPRECATED -DGDK_PIXBUF_DISABLE_DEPRECATED \
	 -	-DGTK_DISABLE_DEPRECATED
	 +	-DGDK_PIXBUF_DISABLE_DEPRECATED
	 SRCS = bdf.c \
	 bdfcons.c \
install :
	 ENV["CPPFLAGS"] = "-DBDF_NO_X11"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--without-x"
	 system "make", "install"

name :
	 Wv
homepage :
	 https://wvware.sourceforge.io/
url :
	 https://abisource.com/downloads/wv/1.2.9/wv-1.2.9.tar.gz
description :
	 Programs for accessing Microsoft Word documents
build_deps :
	 pkg-config
link_deps :
	 glib
	 libgsf
	 libpng
	 libwmf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make"
	 ENV.deparallelize
	 bin.mkpath
	 (lib/"pkgconfig").mkpath
	 (include/"wv").mkpath
	 man1.mkpath
	 (pkgshare/"wingdingfont").mkpath
	 (pkgshare/"patterns").mkpath
	 system "make", "install"

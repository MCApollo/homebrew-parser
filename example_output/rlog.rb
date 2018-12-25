name :
	 Rlog
homepage :
	 https://www.arg0.net/rlog
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/rlog/rlog-1.4.tar.gz
description :
	 Flexible message logging facility for C++
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 --- orig/rlog/common.h.in	2008-06-14 20:10:13.000000000 -0700
	 +++ new/rlog/common.h.in	2009-05-18 16:05:04.000000000 -0700
	 @@ -52,7 +52,12 @@
	 +
	 +#ifdef __APPLE__
	 +
	 +#else
	 +#endif
	 #if __GNUC__ >= 3
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"

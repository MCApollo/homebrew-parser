name :
	 Libspectre
homepage :
	 https://wiki.freedesktop.org/www/Software/libspectre/
url :
	 https://libspectre.freedesktop.org/releases/libspectre-0.2.8.tar.gz
description :
	 Small library for rendering Postscript documents
build_deps :
link_deps :
	 ghostscript
conflicts :
patches :
	 https://github.com/Homebrew/formula-patches/raw/master/libspectre/libspectre-0.2.7-gs918.patch
EOF_patch :
install :
	 ENV.append "CFLAGS", "-I#{Formula["ghostscript"].opt_include}/ghostscript"
	 ENV.append "LIBS", "-L#{Formula["ghostscript"].opt_lib}"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"

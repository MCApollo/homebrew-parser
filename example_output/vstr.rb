name :
	 Vstr
homepage :
	 http://www.and.org/vstr/
url :
	 http://www.and.org/vstr/1.0.15/vstr-1.0.15.tar.bz2
description :
	 C string library
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CFLAGS", "--std=gnu89" if ENV.compiler == :clang
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"

name :
	 Xmp
homepage :
	 https://xmp.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/xmp/xmp/4.1.0/xmp-4.1.0.tar.gz
description :
	 Command-line player for module music formats (MOD, S3M, IT, etc)
build_deps :
	 pkg-config
link_deps :
	 libxmp
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 system "glibtoolize"
	 system "aclocal"
	 system "autoconf"
	 system "automake", "--add-missing"
	 end
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"

name :
	 Augeas
homepage :
	 http://augeas.net
url :
	 http://download.augeas.net/augeas-1.11.0.tar.gz
description :
	 Configuration editing tool and API
build_deps :
	 pkg-config
link_deps :
	 readline
conflicts :
patches :
EOF_patch :
install :
	 args = %W[--disable-debug --disable-dependency-tracking --prefix=#{prefix}]
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"

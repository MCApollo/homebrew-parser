name :
	 P11Kit
homepage :
	 https://p11-glue.freedesktop.org
url :
	 https://github.com/p11-glue/p11-kit/releases/download/0.23.14/p11-kit-0.23.14.tar.gz
description :
	 Library to load and enumerate PKCS#11 modules
build_deps :
	 pkg-config
link_deps :
	 libffi
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["FAKED_MODE"] = "1"
	 if build.head?
	 ENV["NOCONFIGURE"] = "1"
	 system "./autogen.sh"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--disable-trust-module",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--with-module-config=#{etc}/pkcs11/modules",
	 "--without-libtasn1"
	 system "make"
	 system "make", "check"
	 system "make", "install"

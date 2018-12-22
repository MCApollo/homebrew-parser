name :
	 Libslax
homepage :
	 http://www.libslax.org/
url :
	 https://github.com/Juniper/libslax/releases/download/0.22.0/libslax-0.22.0.tar.gz
description :
	 Implementation of the SLAX language (an XSLT alternative)
build_deps :
	 libtool
link_deps :
	 libxml2
	 libxslt
	 sqlite
	 curl
	 openssl
conflicts :
	 genometools
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-L#{Formula["openssl"].opt_lib}"
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
	 end
	 system "sh", "./bin/setup.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-libedit"
	 system "make", "install"

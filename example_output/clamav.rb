name :
	 Clamav
homepage :
	 https://www.clamav.net/
url :
	 https://www.clamav.net/downloads/production/clamav-0.100.2.tar.gz
description :
	 Anti-virus software
build_deps :
	 pkg-config
link_deps :
	 openssl
	 pcre
optional_deps :
	 json-c
	 yara
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --libdir=#{lib}
	 --sysconfdir=#{etc}/clamav
	 --with-openssl=#{Formula["openssl"].opt_prefix}
	 --with-pcre=#{Formula["pcre"].opt_prefix}
	 --disable-zlib-vcheck
	 --enable-llvm=no
	 ]
	 args << (build.with?("json-c") ? "--with-libjson=#{Formula["json-c"].opt_prefix}" : "--without-libjson")
	 args << "--disable-yara" if build.without? "yara"
	 args << "--with-zlib=#{MacOS.sdk_path}/usr" unless MacOS::CLT.installed?
	 pkgshare.mkpath
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", *args
	 system "make", "install"

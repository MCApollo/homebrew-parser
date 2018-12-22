name :
	 Rsyslog
homepage :
	 https://www.rsyslog.com/
url :
	 https://www.rsyslog.com/files/download/rsyslog/rsyslog-8.37.0.tar.gz
description :
	 Enhanced, multi-threaded syslogd
build_deps :
	 pkg-config
link_deps :
	 libestr
conflicts :
patches :
EOF_patch :
install :
	 resource("libfastjson").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{libexec}"
	 system "make", "install"
	 end
	 ENV.prepend_path "PKG_CONFIG_PATH", libexec/"lib/pkgconfig"
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --enable-imfile
	 --enable-usertools
	 --enable-diagtools
	 --disable-uuid
	 --disable-libgcrypt
	 ]
	 system "./configure", *args
	 system "make"
	 system "make", "install"

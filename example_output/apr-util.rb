name :
	 AprUtil
homepage :
	 https://apr.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=apr/apr-util-1.6.1.tar.bz2
description :
	 Companion library to apr, the Apache Portable Runtime library
build_deps :
link_deps :
	 apr
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{libexec}",
	 "--with-apr=#{Formula["apr"].opt_prefix}",
	 "--with-crypto",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make"
	 system "make", "install"
	 bin.install_symlink Dir["#{libexec}/bin/*"]
	 rm Dir[libexec/"lib/*.la"]
	 rm Dir[libexec/"lib/apr-util-1/*.la"]
	 inreplace libexec/"bin/apu-1-config", libexec, opt_libexec

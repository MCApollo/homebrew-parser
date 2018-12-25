name :
	 Apr
homepage :
	 https://apr.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=apr/apr-1.6.5.tar.bz2
description :
	 Apache Portable Runtime library
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["SED"] = "sed"
	 ENV.deparallelize
	 system "./configure", "--prefix=#{libexec}"
	 system "make", "install"
	 bin.install_symlink Dir["#{libexec}/bin/*"]
	 rm Dir[libexec/"lib/*.la"]
	 inreplace libexec/"bin/apr-1-config", libexec, opt_libexec

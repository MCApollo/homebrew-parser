name :
	 Nmap
homepage :
	 https://nmap.org/
url :
	 https://nmap.org/dist/nmap-7.70.tar.bz2
description :
	 Port scanning utility for large networks
build_deps :
link_deps :
	 openssl
	 pygtk
conflicts :
	 ndiff
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 args = %W[
	 --prefix=#{prefix}
	 --with-libpcre=included
	 --with-liblua=included
	 --with-openssl=#{Formula["openssl"].opt_prefix}
	 --without-nmap-update
	 --disable-universal
	 ]
	 args << "--without-zenmap" if build.without? "pygtk"
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 rm_f Dir[bin/"uninstall_*"]

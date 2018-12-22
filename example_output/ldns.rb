name :
	 Ldns
homepage :
	 https://nlnetlabs.nl/projects/ldns/
url :
	 https://nlnetlabs.nl/downloads/ldns/ldns-1.7.0.tar.gz
description :
	 DNS library written in C
build_deps :
	 swig
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --with-drill
	 --with-examples
	 --with-ssl=#{Formula["openssl"].opt_prefix}
	 --with-pyldns
	 PYTHON_SITE_PKG=#{lib}/python2.7/site-packages
	 --disable-dane-verify
	 ]
	 system "./configure", *args
	 inreplace "Makefile" do |s|
	 s.change_make_var! "PYTHON_LDFLAGS", "-undefined dynamic_lookup"
	 s.gsub! /(\$\(PYTHON_LDFLAGS\).*) -no-undefined/, "\\1"
	 end
	 system "make"
	 system "make", "install"
	 system "make", "install-pyldns"
	 (lib/"pkgconfig").install "packaging/libldns.pc"

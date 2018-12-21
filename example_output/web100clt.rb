name :
	 Web100clt
homepage :
	 https://software.internet2.edu/ndt/
url :
	 https://software.internet2.edu/sources/ndt/ndt-3.7.0.2.tar.gz
description :
	 Command-line version of NDT diagnostic client
build_deps :
link_deps :
	 i2util
	 jansson
	 openssl
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/37aa64888341/web100clt/ndt-3.6.5.2-osx-10.9.patch
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "-C", "src", "install"
	 man1.install "doc/web100clt.man" => "web100clt.1"

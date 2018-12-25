name :
	 Monit
homepage :
	 https://mmonit.com/monit/
url :
	 https://mmonit.com/monit/dist/monit-5.25.2.tar.gz
description :
	 Manage and monitor processes, files, directories, and devices
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--localstatedir=#{var}/monit",
	 "--sysconfdir=#{etc}/monit",
	 "--with-ssl-dir=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
	 pkgshare.install "monitrc"

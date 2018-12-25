name :
	 SaneBackends
homepage :
	 http://www.sane-project.org/
url :
	 https://mirrors.kernel.org/debian/pool/main/s/sane-backends/sane-backends_1.0.27.orig.tar.gz
description :
	 Backends for scanner access
build_deps :
	 pkg-config
link_deps :
	 jpeg
	 libpng
	 libtiff
	 libusb
	 net-snmp
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--localstatedir=#{var}",
	 "--without-gphoto2",
	 "--enable-local-backends",
	 "--with-usb=yes"
	 system "make"
	 system "make", "install"
	 (var/"lock/sane").mkpath

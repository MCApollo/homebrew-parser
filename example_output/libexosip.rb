name :
	 Libexosip
homepage :
	 https://www.antisip.com/category/osip-and-exosip-toolkit
url :
	 https://download.savannah.gnu.org/releases/exosip/libeXosip2-4.1.0.tar.gz
description :
	 Toolkit for eXosip2
build_deps :
	 pkg-config
link_deps :
	 libosip
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-framework CoreFoundation -framework CoreServices "\
	 "-framework Security"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"

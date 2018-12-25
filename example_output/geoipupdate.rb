name :
	 Geoipupdate
homepage :
	 https://github.com/maxmind/geoipupdate
url :
	 https://github.com/maxmind/geoipupdate/releases/download/v3.1.1/geoipupdate-3.1.1.tar.gz
description :
	 Automatic updates of GeoIP2 and GeoIP Legacy databases
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
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--datadir=#{var}",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}"
	 system "make", "install"
	 (var/"GeoIP").mkpath
	 system bin/"geoipupdate", "-v"

name :
	 Geoip
homepage :
	 https://github.com/maxmind/geoip-api-c
url :
	 https://github.com/maxmind/geoip-api-c/releases/download/v1.6.12/GeoIP-1.6.12.tar.gz
description :
	 This library is for the GeoIP Legacy format (dat)
build_deps :
link_deps :
	 geoipupdate
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--datadir=#{var}",
	 "--prefix=#{prefix}"
	 system "make", "check"
	 system "make", "install"
	 geoip_data = Pathname.new "#{var}/GeoIP"
	 geoip_data.mkpath
	 legacy_data = Pathname.new "#{HOMEBREW_PREFIX}/share/GeoIP"
	 cp Dir["#{legacy_data}/*"], geoip_data if legacy_data.exist?
	 full = Pathname.new "#{geoip_data}/GeoIP.dat"
	 ln_s "GeoLiteCountry.dat", full unless full.exist? || full.symlink?
	 full = Pathname.new "#{geoip_data}/GeoIPCity.dat"
	 ln_s "GeoLiteCity.dat", full unless full.exist? || full.symlink?

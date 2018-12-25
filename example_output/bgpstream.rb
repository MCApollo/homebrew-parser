name :
	 Bgpstream
homepage :
	 https://bgpstream.caida.org/
url :
	 https://bgpstream.caida.org/bundles/caidabgpstreamwebhomepage/dists/bgpstream-1.1.0.tar.gz
description :
	 For live and historical BGP data analysis
build_deps :
link_deps :
	 wandio
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"

name :
	 Httrack
homepage :
	 https://www.httrack.com/
url :
	 https://mirror.httrack.com/historical/httrack-3.49.2.tar.gz
description :
	 Website copier/offline browser
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
	 ENV.deparallelize
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
	 rm_rf Dir["#{share}/{applications,pixmaps}"]

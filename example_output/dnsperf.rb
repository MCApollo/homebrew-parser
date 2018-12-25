name :
	 Dnsperf
homepage :
	 https://www.akamai.com/us/en/products/network-operator/measurement-tools.jsp
url :
	 http://wwwns.akamai.com/dnsperf-src-2.1.0.0-1.tar.gz
description :
	 Measure DNS performance by simulating network conditions
build_deps :
link_deps :
	 bind
	 libxml2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"

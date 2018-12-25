name :
	 Dnstop
homepage :
	 http://dns.measurement-factory.com/tools/dnstop/index.html
url :
	 http://dns.measurement-factory.com/tools/dnstop/src/dnstop-20140915.tar.gz
description :
	 Console tool to analyze DNS traffic
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 bin.install "dnstop"
	 man8.install "dnstop.8"

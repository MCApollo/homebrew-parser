name :
	 Fq
homepage :
	 https://github.com/circonus-labs/fq
url :
	 https://github.com/circonus-labs/fq/archive/v0.10.14.tar.gz
description :
	 Brokered message queue optimized for performance
build_deps :
link_deps :
	 concurrencykit
	 jlog
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "Makefile", "/usr/lib/dtrace", "#{lib}/dtrace"
	 system "make", "PREFIX=#{prefix}"
	 system "make", "install", "PREFIX=#{prefix}"
	 bin.install "fqc", "fq_sndr", "fq_rcvr"

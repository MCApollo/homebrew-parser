name :
	 Sslsplit
homepage :
	 https://www.roe.ch/SSLsplit
url :
	 https://mirror.roe.ch/rel/sslsplit/sslsplit-0.5.3.tar.bz2
description :
	 Man-in-the-middle attacks against SSL encrypted network connections
build_deps :
	 check
	 pkg-config
link_deps :
	 libevent
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 unless build.head?
	 ENV.deparallelize
	 inreplace "GNUmakefile" do |s|
	 s.gsub! "-o $(BINUID) -g $(BINGID)", ""
	 s.gsub! "-o $(MANUID) -g $(MANGID)", ""
	 end
	 end
	 system "make", "test"
	 system "make", "install", "PREFIX=#{prefix}"

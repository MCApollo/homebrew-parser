name :
	 Pjproject
homepage :
	 https://www.pjsip.org/
url :
	 https://www.pjsip.org/release/2.7.2/pjproject-2.7.2.tar.bz2
description :
	 C library for multimedia protocols such as SIP, SDP, RTP and more
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "dep"
	 system "make"
	 system "make", "install"
	 arch = Utils.popen_read("uname -m").chomp
	 rel = Utils.popen_read("uname -r").chomp
	 bin.install "pjsip-apps/bin/pjsua-#{arch}-apple-darwin#{rel}" => "pjsua"

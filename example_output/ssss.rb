name :
	 Ssss
homepage :
	 http://point-at-infinity.org/ssss/
url :
	 http://point-at-infinity.org/ssss/ssss-0.5.tar.gz
description :
	 Shamir's secret sharing scheme implementation
build_deps :
link_deps :
	 gmp
	 xmltoman
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile" do |s|
	 s.gsub! /\-W /, "-W -DNOMLOCK $(CFLAGS) $(LDFLAGS)"

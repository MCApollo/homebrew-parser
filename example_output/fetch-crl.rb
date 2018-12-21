name :
	 FetchCrl
homepage :
	 https://wiki.nikhef.nl/grid/FetchCRL3
url :
	 https://dist.eugridpma.info/distribution/util/fetch-crl3/fetch-crl-3.0.20.tar.gz
description :
	 Retrieve certificate revocation lists (CRLs)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}", "ETC=#{etc}", "CACHE=#{var}/cache"

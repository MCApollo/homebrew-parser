name :
	 Cidrmerge
homepage :
	 https://cidrmerge.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/cidrmerge/cidrmerge/cidrmerge-1.5.3/cidrmerge-1.5.3.tar.gz
description :
	 CIDR merging with white listing (network exclusion)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "cidrmerge"

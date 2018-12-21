name :
	 When
homepage :
	 http://www.lightandmatter.com/when/when.html
url :
	 https://deb.debian.org/debian/pool/main/w/when/when_1.1.38.orig.tar.gz
description :
	 Tiny personal calendar
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "prefix=#{prefix}", "install"

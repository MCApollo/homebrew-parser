name :
	 IconNamingUtils
homepage :
	 https://specifications.freedesktop.org/icon-naming-spec/icon-naming-spec-latest.html
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/i/icon-naming-utils/icon-naming-utils_0.8.90.orig.tar.gz
description :
	 Script to handle icon names in desktop icon themes
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"

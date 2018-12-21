name :
	 Utf8proc
homepage :
	 https://juliastrings.github.io/utf8proc/
url :
	 https://github.com/JuliaStrings/utf8proc/archive/v2.2.0.tar.gz
description :
	 Clean C library for processing UTF-8 Unicode data
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "prefix=#{prefix}"

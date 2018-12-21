name :
	 Ctemplate
homepage :
	 https://github.com/olafvdspek/ctemplate
url :
	 https://github.com/OlafvdSpek/ctemplate/archive/ctemplate-2.3.tar.gz
description :
	 Template language for C++
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"

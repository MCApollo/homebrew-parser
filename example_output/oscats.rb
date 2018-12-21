name :
	 Oscats
homepage :
	 https://code.google.com/archive/p/oscats/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/oscats/oscats-0.6.tar.gz
description :
	 Computerized adaptive testing system
build_deps :
	 pkg-config
link_deps :
	 glib
	 gsl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"

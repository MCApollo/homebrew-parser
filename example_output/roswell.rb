name :
	 Roswell
homepage :
	 https://github.com/roswell/roswell
url :
	 https://github.com/roswell/roswell/archive/v18.10.10.95.tar.gz
description :
	 Lisp installer and launcher for major environments
build_deps :
	 autoconf
	 automake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"

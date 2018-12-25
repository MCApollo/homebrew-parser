name :
	 Scrub
homepage :
	 https://code.google.com/archive/p/diskscrub/
url :
	 https://github.com/chaos/scrub/releases/download/2.6.1/scrub-2.6.1.tar.gz
description :
	 Writes patterns on magnetic media to thwart data recovery
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"

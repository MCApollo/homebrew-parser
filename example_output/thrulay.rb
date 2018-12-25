name :
	 Thrulay
homepage :
	 https://sourceforge.net/projects/thrulay/
url :
	 https://downloads.sourceforge.net/project/thrulay/thrulay/0.9/thrulay-0.9.tar.gz
description :
	 Measure performance of a network
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 ENV.deparallelize
	 system "make", "install"

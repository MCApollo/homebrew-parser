name :
	 Iperf
homepage :
	 https://sourceforge.net/projects/iperf2/
url :
	 https://downloads.sourceforge.net/project/iperf2/iperf-2.0.12.tar.gz
description :
	 Tool to measure maximum TCP and UDP bandwidth
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
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"

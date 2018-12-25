name :
	 Rtptools
homepage :
	 https://www.cs.columbia.edu/irt/software/rtptools/
url :
	 https://www.cs.columbia.edu/irt/software/rtptools/download/rtptools-1.22.tar.gz
description :
	 Set of tools for processing RTP data
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
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"

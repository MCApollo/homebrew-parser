name :
	 Crfxx
homepage :
	 https://taku910.github.io/crfpp/
url :
	 https://ftp.heanet.ie/mirrors/gentoo.org/distfiles/CRF++-0.58.tar.gz
description :
	 Conditional random fields for segmenting/labeling sequential data
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
	 system "make", "CXXFLAGS=#{ENV.cflags}", "install"

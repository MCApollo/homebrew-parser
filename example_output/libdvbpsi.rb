name :
	 Libdvbpsi
homepage :
	 https://www.videolan.org/developers/libdvbpsi.html
url :
	 https://download.videolan.org/pub/libdvbpsi/1.3.2/libdvbpsi-1.3.2.tar.bz2
description :
	 Library to decode/generate MPEG TS and DVB PSI tables
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
	 system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--enable-release"
	 system "make", "install"

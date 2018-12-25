name :
	 Shairport
homepage :
	 https://github.com/abrasive/shairport
url :
	 https://github.com/abrasive/shairport/archive/1.1.1.tar.gz
description :
	 Airtunes emulator
build_deps :
	 pkg-config
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure"
	 system "make", "install", "PREFIX=#{prefix}"

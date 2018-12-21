name :
	 Libu2fHost
homepage :
	 https://developers.yubico.com/libu2f-host/
url :
	 https://developers.yubico.com/libu2f-host/Releases/libu2f-host-1.1.6.tar.xz
description :
	 Host-side of the Universal 2nd Factor (U2F) protocol
build_deps :
	 pkg-config
link_deps :
	 hidapi
	 json-c
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"

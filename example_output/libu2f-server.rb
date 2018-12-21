name :
	 Libu2fServer
homepage :
	 https://developers.yubico.com/libu2f-server/
url :
	 https://developers.yubico.com/libu2f-server/Releases/libu2f-server-1.1.0.tar.xz
description :
	 Server-side of the Universal 2nd Factor (U2F) protocol
build_deps :
	 check
	 gengetopt
	 help2man
	 pkg-config
link_deps :
	 json-c
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV["LIBSSL_LIBS"] = "-lssl -lcrypto -lz"
	 ENV["LIBCRYPTO_LIBS"] = "-lcrypto -lz"
	 ENV["PKG_CONFIG"] = "#{Formula["pkg-config"].opt_bin}/pkg-config"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"

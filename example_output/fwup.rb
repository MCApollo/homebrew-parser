name :
	 Fwup
homepage :
	 https://github.com/fhunleth/fwup
url :
	 https://github.com/fhunleth/fwup/releases/download/v1.2.7/fwup-1.2.7.tar.gz
description :
	 Configurable embedded Linux firmware update creator and runner
build_deps :
	 pkg-config
link_deps :
	 confuse
	 libarchive
	 libsodium
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"

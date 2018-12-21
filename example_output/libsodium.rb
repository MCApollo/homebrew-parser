name :
	 Libsodium
homepage :
	 https://github.com/jedisct1/libsodium/
url :
	 https://github.com/jedisct1/libsodium/releases/download/1.0.16/libsodium-1.0.16.tar.gz
description :
	 NaCl networking and cryptography library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "check"
	 system "make", "install"

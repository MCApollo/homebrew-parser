name :
	 Libscrypt
homepage :
	 https://lolware.net/libscrypt.html
url :
	 https://github.com/technion/libscrypt/archive/v1.21.tar.gz
description :
	 Library for scrypt
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install-osx", "PREFIX=#{prefix}", "LDFLAGS=", "CFLAGS_EXTRA="
	 system "make", "check", "LDFLAGS=", "CFLAGS_EXTRA="

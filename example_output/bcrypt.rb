name :
	 Bcrypt
homepage :
	 https://bcrypt.sourceforge.io/
url :
	 https://bcrypt.sourceforge.io/bcrypt-1.1.tar.gz
description :
	 Cross platform file encryption utility using blowfish
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags}",
	 "LDFLAGS=-lz"
	 bin.install "bcrypt"
	 man1.install gzip("bcrypt.1")

name :
	 Libtomcrypt
homepage :
	 https://www.libtom.net/
url :
	 https://github.com/libtom/libtomcrypt/archive/v1.18.2.tar.gz
description :
	 Comprehensive, modular and portable cryptographic toolkit
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "test"
	 system "make", "install", "PREFIX=#{prefix}"
	 pkgshare.install "test"
	 (pkgshare/"tests").install "tests/test.key"

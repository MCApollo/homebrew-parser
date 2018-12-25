name :
	 SignifyOsx
homepage :
	 https://man.openbsd.org/OpenBSD-current/man1/signify.1
url :
	 https://github.com/jpouellet/signify-osx/archive/1.3.tar.gz
description :
	 Cryptographically sign and verify files
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
	 system "make"
	 system "make", "test"
	 system "make", "install", "PREFIX=#{prefix}"

name :
	 Argon2
homepage :
	 https://github.com/P-H-C/phc-winner-argon2
url :
	 https://github.com/P-H-C/phc-winner-argon2/archive/20171227.tar.gz
description :
	 Password hashing library and CLI utility
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
	 doc.install "argon2-specs.pdf"

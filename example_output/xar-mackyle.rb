name :
	 XarMackyle
homepage :
	 https://mackyle.github.io/xar/
url :
	 https://github.com/downloads/mackyle/xar/xar-1.6.1.tar.gz
description :
	 eXtensible ARchiver
build_deps :
link_deps :
	 openssl
	 xz
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{libexec}"
	 system "make"
	 ENV.deparallelize { system "make", "install" }
	 bin.install_symlink libexec/"bin/xar" => "xar-mackyle"
	 man1.install_symlink libexec/"share/man/man1/xar.1" => "xar-mackyle.1"

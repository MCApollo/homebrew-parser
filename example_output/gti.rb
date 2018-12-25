name :
	 Gti
homepage :
	 http://r-wos.org/hacks/gti
url :
	 https://github.com/rwos/gti/archive/v1.6.1.tar.gz
description :
	 ASCII-art displaying typo-corrector for commands
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
	 system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}"
	 bin.install "gti"
	 man6.install "gti.6"

name :
	 Picoc
homepage :
	 https://github.com/zsaleeba/picoc
url :
description :
	 C interpreter for scripting
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
	 system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags} -DUNIX_HOST"
	 bin.install "picoc"

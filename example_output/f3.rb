name :
	 F3
homepage :
	 http://oss.digirati.com.br/f3/
url :
	 https://github.com/AltraMayor/f3/archive/v7.1.tar.gz
description :
	 Test various flash cards
build_deps :
link_deps :
	 argp-standalone
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "all", "ARGP=#{Formula["argp-standalone"].opt_prefix}"
	 bin.install %w[f3read f3write]
	 man1.install "f3read.1"
	 man1.install_symlink "f3read.1" => "f3write.1"

name :
	 Chruby
homepage :
	 https://github.com/postmodern/chruby#readme
url :
	 https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
description :
	 Ruby environment tool
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
	 system "make", "install", "PREFIX=#{prefix}"

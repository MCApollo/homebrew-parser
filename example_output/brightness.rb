name :
	 Brightness
homepage :
	 https://github.com/nriley/brightness
url :
	 https://github.com/nriley/brightness/archive/1.2.tar.gz
description :
	 Change macOS display brightness from the command-line
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
	 system "make", "prefix=#{prefix}", "install"

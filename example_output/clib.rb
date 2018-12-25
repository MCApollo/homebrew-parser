name :
	 Clib
homepage :
	 https://github.com/clibs/clib
url :
	 https://github.com/clibs/clib/archive/1.8.1.tar.gz
description :
	 Package manager for C programming
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
	 ENV["PREFIX"] = prefix
	 system "make", "install"

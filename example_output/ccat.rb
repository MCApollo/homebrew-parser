name :
	 Ccat
homepage :
	 https://github.com/jingweno/ccat
url :
	 https://github.com/jingweno/ccat/archive/v1.1.0.tar.gz
description :
	 Like cat but displays content with syntax highlighting
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
	 ccrypt
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./script/build"
	 bin.install "ccat"

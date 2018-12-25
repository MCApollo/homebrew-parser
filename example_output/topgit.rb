name :
	 Topgit
homepage :
	 https://github.com/greenrd/topgit
url :
	 https://github.com/greenrd/topgit/archive/topgit-0.9.tar.gz
description :
	 Git patch queue manager
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
	 system "make", "install", "prefix=#{prefix}"

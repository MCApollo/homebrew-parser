name :
	 Tag
homepage :
	 https://github.com/jdberry/tag/
url :
	 https://github.com/jdberry/tag/archive/v0.9.tar.gz
description :
	 Manipulate and query tags on Mavericks files
build_deps :
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "bin/tag"

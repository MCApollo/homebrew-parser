name :
	 Ren
homepage :
	 http://pdb.finkproject.org/pdb/package.php/ren
url :
	 https://www.ibiblio.org/pub/Linux/utils/file/ren-1.0.tar.gz
description :
	 Rename multiple files in a directory
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
	 bin.install "ren"
	 man1.install "ren.1"

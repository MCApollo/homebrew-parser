name :
	 Trash
homepage :
	 https://hasseg.org/trash/
url :
	 https://github.com/ali-rantakari/trash/archive/v0.9.2.tar.gz
description :
	 CLI tool that moves files or folder to the trash
build_deps :
link_deps :
conflicts :
	 trash-cli
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "docs"
	 bin.install "trash"
	 man1.install "trash.1"

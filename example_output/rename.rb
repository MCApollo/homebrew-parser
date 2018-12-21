name :
	 Rename
homepage :
	 http://plasmasturm.org/code/rename
url :
	 https://github.com/ap/rename/archive/v1.600.tar.gz
description :
	 Perl-powered file rename script with many helpful built-ins
build_deps :
link_deps :
conflicts :
	 util-linux
patches :
EOF_patch :
install :
	 system "pod2man", "rename", "rename.1"
	 bin.install "rename"
	 man1.install "rename.1"

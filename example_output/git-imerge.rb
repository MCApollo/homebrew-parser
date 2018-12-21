name :
	 GitImerge
homepage :
	 https://github.com/mhagger/git-imerge
url :
	 https://github.com/mhagger/git-imerge/archive/v1.1.0.tar.gz
description :
	 Incremental merge for git
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.mkpath
	 system "make", "install", "DESTDIR=#{prefix}", "PREFIX="

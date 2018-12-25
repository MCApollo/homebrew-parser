name :
	 Fmdiff
homepage :
	 https://www.defraine.net/~brunod/fmdiff/
url :
	 https://github.com/brunodefraine/fmscripts/archive/20150915.tar.gz
description :
	 Use FileMerge as a diff command for Subversion and Mercurial
build_deps :
link_deps :
	 :xcode
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "DESTDIR=#{bin}", "install"

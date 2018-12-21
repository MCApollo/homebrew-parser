name :
	 Entr
homepage :
	 http://entrproject.org/
url :
	 http://entrproject.org/code/entr-4.1.tar.gz
description :
	 Run arbitrary commands when files change
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["PREFIX"] = prefix
	 ENV["MANPREFIX"] = man
	 system "./configure"
	 system "make"
	 system "make", "install"

name :
	 CKermit
homepage :
	 http://www.kermitproject.org/
url :
	 http://www.kermitproject.org/ftp/kermit/archives/cku302.tar.gz
description :
	 Scriptable network and serial communication for UNIX and VMS
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
	 system "make", "macosx"
	 man1.mkpath
	 system "make", "prefix=#{prefix}", "manroot=#{share}", "install"

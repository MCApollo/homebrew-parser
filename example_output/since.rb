name :
	 Since
homepage :
	 http://welz.org.za/projects/since
url :
	 http://welz.org.za/projects/since/since-1.1.tar.gz
description :
	 Stateful tail: show changes to files since last check
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.mkpath
	 man1.mkpath
	 system "make", "install", "prefix=#{prefix}", "INSTALL=install"

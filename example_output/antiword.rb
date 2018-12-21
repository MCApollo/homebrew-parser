name :
	 Antiword
homepage :
	 http://www.winfield.demon.nl/
url :
	 http://www.winfield.demon.nl/linux/antiword-0.37.tar.gz
description :
	 Utility to read Word (.doc) files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "antiword.h", "/usr/share/antiword", pkgshare
	 system "make", "CC=#{ENV.cc}",
	 "LD=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags} -DNDEBUG",
	 "GLOBAL_INSTALL_DIR=#{bin}",
	 "GLOBAL_RESOURCES_DIR=#{pkgshare}"
	 bin.install "antiword"
	 pkgshare.install Dir["Resources/*"]
	 man1.install "Docs/antiword.1"

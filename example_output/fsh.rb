name :
	 Fsh
homepage :
	 https://www.lysator.liu.se/fsh/
url :
	 https://www.lysator.liu.se/fsh/fsh-1.2.tar.gz
description :
	 Provides remote command execution
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "fshcompat.py", "FCNTL", "fcntl"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--infodir=#{info}"
	 system "make", "install"

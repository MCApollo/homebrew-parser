name :
	 Zssh
homepage :
	 https://zssh.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/zssh/zssh/1.5/zssh-1.5c.tgz
description :
	 Interactive file transfers over SSH
build_deps :
link_deps :
	 lrzsz
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 bin.install "zssh", "ztelnet"
	 man1.install "zssh.1", "ztelnet.1"

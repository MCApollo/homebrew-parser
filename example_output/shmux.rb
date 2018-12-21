name :
	 Shmux
homepage :
	 https://github.com/shmux/shmux
url :
	 https://github.com/shmux/shmux/archive/v1.0.2.tar.gz
description :
	 Execute the same command on many hosts in parallel
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"

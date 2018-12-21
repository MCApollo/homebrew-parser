name :
	 Lha
homepage :
	 https://lha.osdn.jp/
url :
	 https://dotsrc.dl.osdn.net/osdn/lha/22231/lha-1.14i-ac20050924p1.tar.gz
description :
	 Utility for creating and opening lzh archives
build_deps :
link_deps :
conflicts :
	 lhasa
patches :
EOF_patch :
install :
	 system "autoreconf", "-is" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"

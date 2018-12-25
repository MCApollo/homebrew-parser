name :
	 Ipbt
homepage :
	 https://www.chiark.greenend.org.uk/~sgtatham/ipbt/
url :
	 https://www.chiark.greenend.org.uk/~sgtatham/ipbt/ipbt-20170831.3c40fd3.tar.gz
description :
	 Program for recording a UNIX terminal session
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
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking"
	 system "make", "install"

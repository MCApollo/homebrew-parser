name :
	 Direvent
homepage :
	 https://www.gnu.org.ua/software/direvent/direvent.html
url :
	 https://ftp.gnu.org/gnu/direvent/direvent-5.1.tar.gz
description :
	 Monitors events in the file system directories
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
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"

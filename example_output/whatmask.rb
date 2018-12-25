name :
	 Whatmask
homepage :
	 http://www.laffeycomputer.com/whatmask.html
url :
	 https://web.archive.org/web/20170107110521/downloads.laffeycomputer.com/current_builds/whatmask/whatmask-1.2.tar.gz
description :
	 Network settings helper
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--mandir=#{man}",
	 "--prefix=#{prefix}"
	 system "make", "install"

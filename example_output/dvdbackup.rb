name :
	 Dvdbackup
homepage :
	 https://dvdbackup.sourceforge.io
url :
	 https://downloads.sourceforge.net/dvdbackup/dvdbackup-0.4.2.tar.gz
description :
	 Rip DVD's from the command-line
build_deps :
link_deps :
	 libdvdread
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--mandir=#{man}",
	 "--prefix=#{prefix}"
	 system "make", "install"

name :
	 Duff
homepage :
	 https://duff.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/duff/duff/0.5.2/duff-0.5.2.tar.gz
description :
	 Quickly find duplicates in a set of files from the command-line
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
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"

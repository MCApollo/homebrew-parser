name :
	 Nsuds
homepage :
	 https://nsuds.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/nsuds/nsuds/nsuds-0.7B/nsuds-0.7B.tar.gz
description :
	 Ncurses Sudoku system
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
	 system "autoreconf", "-i" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 inreplace "src/Makefile", /chgrp .*/, ""
	 system "make", "install"

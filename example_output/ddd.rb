name :
	 Ddd
homepage :
	 https://www.gnu.org/s/ddd/
url :
	 https://ftp.gnu.org/gnu/ddd/ddd-3.3.12.tar.gz
description :
	 Graphical front-end for command-line debuggers
build_deps :
link_deps :
	 openmotif
	 :x11
conflicts :
patches :
	 https://savannah.gnu.org/patch/download.php?file_id=29114
	 https://savannah.gnu.org/patch/download.php?file_id=31132
	 https://raw.githubusercontent.com/macports/macports-ports/a71fa9f4/devel/ddd/files/patch-unknown-type-name-a_class.diff
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--enable-builtin-app-defaults",
	 "--enable-builtin-manual",
	 "--prefix=#{prefix}"
	 system "make", "EXEEXT=exe"
	 ENV.deparallelize
	 system "make", "install", "EXEEXT=exe"
	 mv bin/"dddexe", bin/"ddd"

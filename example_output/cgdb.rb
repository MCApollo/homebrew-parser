name :
	 Cgdb
homepage :
	 https://cgdb.github.io/
url :
	 https://cgdb.me/files/cgdb-0.7.0.tar.gz
description :
	 Curses-based interface to the GNU Debugger
build_deps :
	 help2man
link_deps :
	 readline
conflicts :
patches :
EOF_patch :
install :
	 system "sh", "autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-readline=#{Formula["readline"].opt_prefix}"
	 system "make", "install"

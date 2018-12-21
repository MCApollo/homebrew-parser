name :
	 Jcal
homepage :
	 https://savannah.nongnu.org/projects/jcal/
url :
	 https://download.savannah.gnu.org/releases/jcal/jcal-0.4.1.tar.gz
description :
	 UNIX-cal-like tool to display Jalali calendar
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "/bin/sh", "autogen.sh"
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-dependency-tracking"
	 system "make"
	 system "make", "install"

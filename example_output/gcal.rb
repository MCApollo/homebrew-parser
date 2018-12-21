name :
	 Gcal
homepage :
	 https://www.gnu.org/software/gcal/
url :
	 https://ftp.gnu.org/gnu/gcal/gcal-4.1.tar.xz
description :
	 Program for calculating and printing calendars
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
	 system "make", "-C", "doc/en", "html"
	 doc.install "doc/en/gcal.html"

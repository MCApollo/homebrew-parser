name :
	 Hello
homepage :
	 https://www.gnu.org/software/hello/
url :
	 https://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz
description :
	 Program providing model for GNU coding standards and practices
build_deps :
link_deps :
conflicts :
	 camlistore
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"

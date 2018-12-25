name :
	 Help2man
homepage :
	 https://www.gnu.org/software/help2man/
url :
	 https://ftp.gnu.org/gnu/help2man/help2man-1.47.8.tar.xz
description :
	 Automatically generate simple man pages
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
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"

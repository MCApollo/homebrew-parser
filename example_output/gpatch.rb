name :
	 Gpatch
homepage :
	 https://savannah.gnu.org/projects/patch/
url :
	 https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz
description :
	 Apply a diff file to an original
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
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"

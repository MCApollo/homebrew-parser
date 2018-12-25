name :
	 Stow
homepage :
	 https://www.gnu.org/software/stow/
url :
	 https://ftp.gnu.org/gnu/stow/stow-2.2.2.tar.gz
description :
	 Organize software neatly under a single directory tree (e.g. /usr/local)
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"

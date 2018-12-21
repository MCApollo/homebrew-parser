name :
	 Snapraid
homepage :
	 https://snapraid.sourceforge.io/
url :
	 https://github.com/amadvance/snapraid/releases/download/v11.3/snapraid-11.3.tar.gz
description :
	 Backup program for disk arrays
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"

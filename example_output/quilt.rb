name :
	 Quilt
homepage :
	 https://savannah.nongnu.org/projects/quilt
url :
	 https://download.savannah.gnu.org/releases/quilt/quilt-0.65.tar.gz
description :
	 Work with series of patches
build_deps :
link_deps :
	 coreutils
	 gnu-sed
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--with-sed=#{HOMEBREW_PREFIX}/bin/gsed",
	 "--without-getopt"
	 system "make"
	 system "make", "install", "emacsdir=#{elisp}"

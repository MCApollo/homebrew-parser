name :
	 Ssed
homepage :
	 https://sed.sourceforge.io/grabbag/ssed/
url :
	 https://sed.sourceforge.io/grabbag/ssed/sed-3.62.tar.gz
description :
	 Super sed stream editor
build_deps :
link_deps :
optional_deps :
conflicts :
	 gnu-sed
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--infodir=#{info}",
	 "--program-prefix=s"
	 system "make", "install"

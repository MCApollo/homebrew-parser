name :
	 Xmlstarlet
homepage :
	 https://xmlstar.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/xmlstar/xmlstarlet/1.6.1/xmlstarlet-1.6.1.tar.gz
description :
	 XML command-line utilities
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make"
	 system "make", "install"
	 bin.install_symlink "xml" => "xmlstarlet"

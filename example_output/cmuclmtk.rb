name :
	 Cmuclmtk
homepage :
	 https://cmusphinx.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/cmusphinx/cmuclmtk/0.7/cmuclmtk-0.7.tar.gz
description :
	 Language model tools (from CMU Sphinx)
build_deps :
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"

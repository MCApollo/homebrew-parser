name :
	 Bashish
homepage :
	 https://bashish.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/bashish/bashish/2.2.4/bashish-2.2.4.tar.gz
description :
	 Theme environment for text terminals
build_deps :
link_deps :
	 dialog
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"

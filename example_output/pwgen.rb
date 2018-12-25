name :
	 Pwgen
homepage :
	 https://pwgen.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/pwgen/pwgen/2.08/pwgen-2.08.tar.gz
description :
	 Password generator
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"

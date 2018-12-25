name :
	 Pv
homepage :
	 https://www.ivarch.com/programs/pv.shtml
url :
	 https://www.ivarch.com/programs/sources/pv-1.6.6.tar.bz2
description :
	 Monitor data's progress through a pipe
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
	 system "./configure", "--disable-debug", "--prefix=#{prefix}",
	 "--mandir=#{man}", "--disable-nls"
	 system "make", "install"

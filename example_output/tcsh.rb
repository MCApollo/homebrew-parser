name :
	 Tcsh
homepage :
	 https://web.archive.org/web/20170609182511/www.tcsh.org/Home
url :
	 ftp://ftp.astron.com/pub/tcsh/tcsh-6.20.00.tar.gz
description :
	 Enhanced, fully compatible version of the Berkeley C shell
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
	 system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}"
	 system "make", "install"

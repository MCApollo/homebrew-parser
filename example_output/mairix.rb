name :
	 Mairix
homepage :
	 http://www.rpcurnow.force9.co.uk/mairix/
url :
	 https://downloads.sourceforge.net/project/mairix/mairix/0.24/mairix-0.24.tar.gz
description :
	 Email index and search tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make"
	 system "make", "install"

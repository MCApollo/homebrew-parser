name :
	 Ccal
homepage :
	 https://ccal.chinesebay.com/ccal
url :
	 https://ccal.chinesebay.com/ccal/ccal-2.5.3.tar.gz
description :
	 Create Chinese calendars for print or browsing
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
	 system "make", "-e", "BINDIR=#{bin}", "install"
	 system "make", "-e", "MANDIR=#{man}", "install-man"

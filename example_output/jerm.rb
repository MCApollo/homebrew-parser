name :
	 Jerm
homepage :
	 https://web.archive.org/web/20160719014241/bsddiary.net/jerm/
url :
	 https://web.archive.org/web/20160719014241/bsddiary.net/jerm/jerm-8096.tar.gz
description :
	 Communication terminal through serial and TCP/IP interfaces
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
	 system "make", "all"
	 bin.install %w[jerm tiocdtr]
	 man1.install Dir["*.1"]

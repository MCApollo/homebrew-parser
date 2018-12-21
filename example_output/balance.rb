name :
	 Balance
homepage :
	 https://www.inlab.net/balance/
url :
	 https://www.inlab.net/wp-content/uploads/2018/05/balance-3.57.tar.gz
description :
	 Software load balancer
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "balance"
	 man1.install "balance.1"

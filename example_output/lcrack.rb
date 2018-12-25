name :
	 Lcrack
homepage :
	 https://packages.debian.org/sid/lcrack
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/l/lcrack/lcrack_20040914.orig.tar.gz
description :
	 Generic password cracker
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
	 system "./configure"
	 system "make"
	 bin.install "lcrack"
	 %w[mktbl mkword regex].each do |prog|
	 bin.install prog => "lcrack_#{prog}"
	 end

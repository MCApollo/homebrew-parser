name :
	 Hostdb
homepage :
	 https://code.google.com/archive/p/hostdb/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/hostdb/hostdb-1.004.tgz
description :
	 Generate DNS zones and DHCP configuration from hostlist.txt
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
	 bin.install Dir["bin/*"]
	 doc.install Dir["docs/*"]
	 pkgshare.install "examples"

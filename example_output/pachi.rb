name :
	 Pachi
homepage :
	 http://pachi.or.cz/
url :
	 https://repo.or.cz/pachi.git/snapshot/pachi-11.00-retsugen.tar.gz
description :
	 Software for the Board Game of Go/Weiqi/Baduk
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["MAC"] = "1"
	 ENV["DOUBLE_FLOATING"] = "1"
	 system "make"
	 bin.install "pachi"
	 pkgshare.install resource("patterns")
	 pkgshare.install resource("book")

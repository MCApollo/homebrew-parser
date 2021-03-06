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
optional_deps :
conflicts :
resource :
	 ['patterns', 'book']
	 ['https://sainet-dist.s3.amazonaws.com/pachi_patterns.zip', 'https://gnugo.baduk.org/books/ra6.zip']
patches :
EOF_patch :
install :
	 ENV["MAC"] = "1"
	 ENV["DOUBLE_FLOATING"] = "1"
	 system "make"
	 bin.install "pachi"
	 pkgshare.install resource("patterns")
	 pkgshare.install resource("book")

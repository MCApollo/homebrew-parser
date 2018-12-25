name :
	 Zpaq
homepage :
	 http://mattmahoney.net/dc/zpaq.html
url :
	 http://mattmahoney.net/dc/zpaq715.zip
description :
	 Incremental, journaling command-line archiver
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['test']
	 ['http://mattmahoney.net/dc/calgarytest2.zpaq']
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "check"
	 system "make", "install", "PREFIX=#{prefix}"

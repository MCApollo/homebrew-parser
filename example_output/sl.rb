name :
	 Sl
homepage :
	 https://github.com/mtoyoda/sl
url :
	 https://github.com/mtoyoda/sl/archive/5.02.tar.gz
description :
	 Prints a steam locomotive if you type sl instead of ls
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
	 system "make", "-e"
	 bin.install "sl"
	 man1.install "sl.1"

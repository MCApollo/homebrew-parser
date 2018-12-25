name :
	 TaskSpooler
homepage :
	 https://vicerveza.homeunix.net/~viric/soft/ts/
url :
	 https://vicerveza.homeunix.net/~viric/soft/ts/ts-1.0.tar.gz
description :
	 Batch system to run tasks one after another
build_deps :
link_deps :
optional_deps :
conflicts :
	 moreutils
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"

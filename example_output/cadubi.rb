name :
	 Cadubi
homepage :
	 https://github.com/statico/cadubi/
url :
	 https://github.com/statico/cadubi/archive/v1.3.4.tar.gz
description :
	 Creative ASCII drawing utility
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
	 inreplace "cadubi", "$Bin/help.txt", "#{doc}/help.txt"
	 bin.install "cadubi"
	 doc.install "help.txt"
	 man1.install "cadubi.1"

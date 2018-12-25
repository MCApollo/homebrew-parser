name :
	 Yamdi
homepage :
	 https://yamdi.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/yamdi/yamdi/1.9/yamdi-1.9.tar.gz
description :
	 Add metadata to Flash video
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
	 system ENV.cc, ENV.cflags, "yamdi.c", "-o", "yamdi"
	 bin.install "yamdi"
	 man1.install "man1/yamdi.1"

name :
	 Malbolge
homepage :
	 https://esoteric.sange.fi/orphaned/malbolge/README.txt
url :
	 https://esoteric.sange.fi/orphaned/malbolge/malbolge.c
description :
	 Deliberately difficult to program esoteric programming language
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 --- /malbolge.c
	 +++ /malbolge.c
	 25d24
	 < #include <malloc.h>
install :
	 system ENV.cxx, "malbolge.c", "-o", "malbolge"
	 bin.install "malbolge"

name :
	 Align
homepage :
	 https://www.cs.indiana.edu/~kinzler/align/
url :
	 https://www.cs.indiana.edu/~kinzler/align/align-1.7.5.tgz
description :
	 Text column alignment filter
build_deps :
link_deps :
optional_deps :
conflicts :
	 speech-tools
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install", "BINDIR=#{bin}"

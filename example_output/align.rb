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
conflicts :
	 speech-tools
patches :
EOF_patch :
install :
	 system "make", "install", "BINDIR=#{bin}"

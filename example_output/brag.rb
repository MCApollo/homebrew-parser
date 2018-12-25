name :
	 Brag
homepage :
	 https://brag.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/brag/brag/1.4.3/brag-1.4.3.tar.gz
description :
	 Download and assemble multipart binaries from newsgroups
build_deps :
link_deps :
	 uudeview
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install "brag"
	 man1.install "brag.1"

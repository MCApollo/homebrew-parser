name :
	 Fex
homepage :
	 https://www.semicomplete.com/projects/fex/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/semicomplete/fex-2.0.0.tar.gz
description :
	 Powerful field extraction tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"

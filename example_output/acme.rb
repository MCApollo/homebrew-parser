name :
	 Acme
homepage :
	 https://sourceforge.net/projects/acme-crossass/
url :
	 97
description :
	 Crossassembler for multiple environments
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "-C", "src", "install", "BINDIR=#{bin}"
	 doc.install Dir["docs/*"]

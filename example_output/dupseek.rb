name :
	 Dupseek
homepage :
	 http://www.beautylabs.net/software/dupseek.html
url :
	 http://www.beautylabs.net/software/dupseek-1.3.tgz
description :
	 Interactive program to find and remove duplicate files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "dupseek"
	 doc.install %w[changelog.txt doc.txt copyright credits.txt]

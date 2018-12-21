name :
	 Inform6
homepage :
	 https://inform-fiction.org/inform6.html
url :
	 https://inform-fiction.org/examples/Adventureland/Adventureland.inf
description :
	 Design system for interactive fiction
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "MAN_PREFIX=#{man}", "install"

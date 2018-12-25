name :
	 Inform6
homepage :
	 https://inform-fiction.org/inform6.html
url :
description :
	 Design system for interactive fiction
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['Adventureland.inf']
	 ['https://inform-fiction.org/examples/Adventureland/Adventureland.inf']
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "MAN_PREFIX=#{man}", "install"

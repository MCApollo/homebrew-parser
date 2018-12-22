name :
	 Xtitle
homepage :
	 https://www.cs.indiana.edu/~kinzler/xtitle/
url :
	 https://www.cs.indiana.edu/~kinzler/xtitle/xtitle-1.0.4.tgz
description :
	 Set window title and icon for your X terminal
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "xtitle.sh" => "xtitle"
	 bin.install "xtctl.sh" => "xtctl"
	 man1.install "xtitle.man" => "xtitle.1"

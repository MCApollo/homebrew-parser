name :
	 CreateDmg
homepage :
	 https://github.com/andreyvit/create-dmg
url :
	 https://github.com/andreyvit/create-dmg/archive/v1.0.0.5.tar.gz
description :
	 Shell script to build fancy DMGs
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "support/brew-me.sh"
	 bin.install "create-dmg"

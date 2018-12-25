name :
	 FonFlashCli
homepage :
	 https://www.gargoyle-router.com/wiki/doku.php?id=fon_flash
url :
	 https://www.gargoyle-router.com/downloads/src/gargoyle_1.10.0-src.tar.gz
description :
	 Flash La Fonera and Atheros chipset compatible devices
build_deps :
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "fon-flash" do
	 system "make", "fon-flash"
	 bin.install "fon-flash"
	 end

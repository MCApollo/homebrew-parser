name :
	 Bubbros
homepage :
	 https://bub-n-bros.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/bub-n-bros/bub-n-bros/1.6.2/bubbros-1.6.2.tar.gz
description :
	 The Bub's Brothers: Clone of the famous Bubble Bobble game
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://sources.debian.net/data/main/b/bubbros/1.6.2-1/debian/patches/replace_sf_logo.patch
	 https://sources.debian.net/data/main/b/bubbros/1.6.2-1/debian/patches/config_in_homedir.patch
	 https://sources.debian.net/data/main/b/bubbros/1.6.2-1/debian/patches/disable_runtime_image_building.patch
	 https://sources.debian.net/data/main/b/bubbros/1.6.2-1/debian/patches/manpages.patch
	 https://sources.debian.net/data/main/b/bubbros/1.6.2-1/debian/patches/remove_shabangs.patch
EOF_patch :
install :
	 system "make", "-C", "bubbob"
	 system "python", "bubbob/images/buildcolors.py"
	 man6.install "doc/BubBob.py.1" => "bubbros.6"
	 man6.install "doc/Client.py.1" => "bubbros-client.6"
	 man6.install "doc/bb.py.1" => "bubbros-server.6"
	 prefix.install Dir["*"]
	 bin.mkpath
	 (bin/"bubbros").write shim_script("BubBob.py")
	 (bin/"bubbros-client").write shim_script("display/Client.py")
	 (bin/"bubbros-server").write shim_script("bubbob/bb.py")

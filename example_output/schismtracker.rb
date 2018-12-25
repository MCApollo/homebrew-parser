name :
	 Schismtracker
homepage :
	 http://schismtracker.org/
url :
	 https://github.com/schismtracker/schismtracker/archive/20180810.tar.gz
description :
	 Portable reimplementation of Impulse Tracker
build_deps :
	 autoconf
	 automake
link_deps :
	 sdl
optional_deps :
conflicts :
resource :
	 ['demo_mods']
	 ['https://files.scene.org/get:us-http/mirrors/modsoulbrother/vim/vim-best-of.zip']
patches :
EOF_patch :
install :
	 system "autoreconf", "-ivf"
	 mkdir "build" do
	 mkdir "auto"
	 system "../configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 end

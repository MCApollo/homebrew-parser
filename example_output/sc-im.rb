name :
	 ScIm
homepage :
	 https://github.com/andmarti1424/sc-im
url :
	 https://github.com/andmarti1424/sc-im/archive/v0.7.0.tar.gz
description :
	 Spreadsheet program for the terminal, using ncurses
build_deps :
link_deps :
	 ncurses
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "src" do
	 system "make", "prefix=#{prefix}"
	 system "make", "prefix=#{prefix}", "install"
	 end

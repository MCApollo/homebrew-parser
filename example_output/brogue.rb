name :
	 Brogue
homepage :
	 https://sites.google.com/site/broguegame/
url :
	 https://sites.google.com/site/broguegame/brogue-1.7.5-linux-amd64.tbz2
description :
	 Roguelike game
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/c999df7dff/brogue/1.7.4.patch
EOF_patch :
install :
	 (var/"brogue").mkpath
	 doc.install "Readme.rtf" => "README.rtf"
	 doc.install "agpl.txt" => "COPYING"
	 system "make", "clean", "curses"
	 inreplace "brogue", %r{`dirname \$0`/bin$}, libexec
	 bin.install "brogue"
	 libexec.install "bin/brogue", "bin/keymap"

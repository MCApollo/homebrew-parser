name :
	 Bastet
homepage :
	 http://fph.altervista.org/prog/bastet.html
url :
	 https://github.com/fph/bastet/archive/0.43.2.tar.gz
description :
	 Bastard Tetris
build_deps :
link_deps :
	 boost
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/fph/bastet/commit/0e03f8d4.patch?full_index=1
EOF_patch :
install :
	 inreplace %w[Config.cpp bastet.6], "/var", var
	 system "make", "all"
	 (var/"games").mkpath
	 touch "#{var}/games/bastet.scores2"
	 bin.install "bastet"
	 man6.install "bastet.6"

name :
	 Mp3info
homepage :
	 https://www.ibiblio.org/mp3info/
url :
	 https://www.ibiblio.org/pub/linux/apps/sound/mp3-utils/mp3info/mp3info-0.8.5a.tgz
description :
	 MP3 technical info viewer and ID3 1.x tag editor
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/bedf6f8/mp3info/patch-mp3tech.c.diff
EOF_patch :
install :
	 system "make", "mp3info", "doc"
	 bin.install "mp3info"
	 man1.install "mp3info.1"

name :
	 Proctools
homepage :
	 https://proctools.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/proctools/proctools/0.4pre1/proctools-0.4pre1.tar.gz
description :
	 pgrep, pkill, and pfind for OpenBSD and Darwin (macOS)
build_deps :
	 bsdmake
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/f411d167/proctools/patch-#{name}.diff
EOF_patch :
install :
	 system "bsdmake", "PREFIX=#{prefix}"
	 ["pgrep/pgrep", "pkill/pkill", "pfind/pfind"].each do |prog|
	 bin.install prog
	 man1.install prog + ".1"
	 end

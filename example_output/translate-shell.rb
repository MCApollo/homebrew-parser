name :
	 TranslateShell
homepage :
	 https://www.soimort.org/translate-shell
url :
	 https://github.com/soimort/translate-shell/archive/v0.9.6.8.tar.gz
description :
	 Command-line translator using Google Translate and more
build_deps :
link_deps :
	 fribidi
	 gawk
	 rlwrap
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "build/trans"
	 man1.install "man/trans.1"

name :
	 Tth
homepage :
	 http://hutchinson.belmont.ma.us/tth/
url :
	 http://hutchinson.belmont.ma.us/tth/tth_distribution/tth_4.12.tgz
description :
	 TeX/LaTeX to HTML converter
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
	 system ENV.cc, "-o", "tth", "tth.c"
	 bin.install %w[tth latex2gif ps2gif ps2png]
	 man1.install "tth.1"

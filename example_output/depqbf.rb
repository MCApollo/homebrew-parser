name :
	 Depqbf
homepage :
	 https://lonsing.github.io/depqbf/
url :
	 https://github.com/lonsing/depqbf/archive/version-6.03.tar.gz
description :
	 Solver for quantified boolean formulae (QBF)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['nenofex', 'picosat']
	 ['https://github.com/lonsing/nenofex/archive/version-1.1.tar.gz', 'http://fmv.jku.at/picosat/picosat-960.tar.gz']
patches :
EOF_patch :
install :
	 (buildpath/"nenofex").install resource("nenofex")
	 (buildpath/"picosat-960").install resource("picosat")
	 system "./compile.sh"
	 bin.install "depqbf"
	 lib.install "libqdpll.a", "libqdpll.1.0.dylib"

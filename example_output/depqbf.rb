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
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"nenofex").install resource("nenofex")
	 (buildpath/"picosat-960").install resource("picosat")
	 system "./compile.sh"
	 bin.install "depqbf"
	 lib.install "libqdpll.a", "libqdpll.1.0.dylib"

name :
	 Ltl2ba
homepage :
	 https://www.lsv.ens-cachan.fr/~gastin/ltl2ba/
url :
	 https://www.lsv.ens-cachan.fr/~gastin/ltl2ba/ltl2ba-1.2b1.tar.gz
description :
	 Translate LTL formulae to Buchi automata
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "ltl2ba"

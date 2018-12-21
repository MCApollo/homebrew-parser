name :
	 BoostAT159
homepage :
	 https://www.boost.org
url :
	 https://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2
description :
	 Collection of portable C++ source libraries
build_deps :
link_deps :
	 icu4c
	 icu4c
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/2ccb6715b3/boost/boost159-questionable-operator.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/2ccb6715b3/boost/boost159-missing-symbols.patch
EOF_patch :
install :
	 open("user-config.jam", "a") do |file|
	 file.write "using darwin : : #{ENV.cxx} ;\n"

name :
	 BoostAT155
homepage :
	 https://www.boost.org
url :
	 https://downloads.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.tar.bz2
description :
	 Collection of portable C++ source libraries
build_deps :
link_deps :
conflicts :
patches :
	 https://github.com/boostorg/atomic/commit/6bb71fdd.diff?full_index=1
	 https://github.com/boostorg/atomic/commit/e4bde20f.diff?full_index=1
	 https://github.com/boostorg/chrono/commit/143260d.diff?full_index=1
EOF_patch :
install :
	 inreplace "boost/archive/iterators/transform_width.hpp",
	 "#include <boost/iterator/iterator_traits.hpp>",
	 "#include <boost/iterator/iterator_traits.hpp>\n#include <algorithm>"
	 open("user-config.jam", "a") do |file|
	 file.write "using darwin : : #{ENV.cxx} ;\n"

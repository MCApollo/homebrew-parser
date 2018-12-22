name :
	 BoostBcp
homepage :
	 https://www.boost.org/doc/tools/bcp/
url :
	 https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.bz2
description :
	 Utility for extracting subsets of the Boost library
build_deps :
	 boost-build
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "tools/bcp" do
	 system "b2"
	 prefix.install "../../dist/bin"
	 end

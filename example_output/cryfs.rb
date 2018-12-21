name :
	 Cryfs
homepage :
	 https://www.cryfs.org
url :
	 https://github.com/cryfs/cryfs/releases/download/0.9.9/cryfs-0.9.9.tar.xz
description :
	 Encrypts your files so you can safely store them in Dropbox, iCloud, etc.
build_deps :
	 cmake
link_deps :
	 boost
	 cryptopp
	 openssl
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 configure_args = [
	 "-DBUILD_TESTING=off",
	 ]
	 if build.head?
	 libomp = Formula["libomp"]
	 configure_args.concat(
	 [
	 "-DOpenMP_CXX_FLAGS='-Xpreprocessor -fopenmp -I#{libomp.include}'",
	 "-DOpenMP_CXX_LIB_NAMES=omp",
	 "-DOpenMP_omp_LIBRARY=#{libomp.lib}/libomp.dylib",
	 ],
	 )

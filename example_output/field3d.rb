name :
	 Field3d
homepage :
	 https://sites.google.com/site/field3d/
url :
	 https://github.com/imageworks/Field3D/archive/v1.7.2.tar.gz
description :
	 Library for storing voxel data on disk and in memory
build_deps :
	 scons
link_deps :
	 boost
	 hdf5
	 ilmbase
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 scons
	 include.install Dir["install/**/**/release/include/*"]
	 lib.install Dir["install/**/**/release/lib/*"]
	 man1.install "man/f3dinfo.1"
	 pkgshare.install "contrib", "test", "apps/sample_code"

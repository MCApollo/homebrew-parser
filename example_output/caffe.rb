name :
	 Caffe
homepage :
	 https://caffe.berkeleyvision.org/
url :
	 https://github.com/BVLC/caffe/archive/1.0.tar.gz
description :
	 Fast open framework for deep learning
build_deps :
	 cmake
link_deps :
	 boost
	 gflags
	 glog
	 hdf5
	 leveldb
	 lmdb
	 opencv
	 protobuf
	 snappy
	 szip
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 args = std_cmake_args + %w[
	 -DALLOW_LMDB_NOLOCK=OFF
	 -DBUILD_SHARED_LIBS=ON
	 -DBUILD_docs=OFF
	 -DBUILD_matlab=OFF
	 -DBUILD_python=OFF
	 -DBUILD_python_layer=OFF
	 -DCPU_ONLY=ON
	 -DUSE_LEVELDB=ON
	 -DUSE_LMDB=ON
	 -DUSE_NCCL=OFF
	 -DUSE_OPENCV=ON
	 -DUSE_OPENMP=OFF
	 ]
	 system "cmake", ".", *args
	 system "make", "install"
	 pkgshare.install "models"

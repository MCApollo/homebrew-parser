name :
	 Encfs
homepage :
	 https://vgough.github.io/encfs/
url :
	 https://github.com/vgough/encfs/archive/v1.9.5.tar.gz
description :
	 Encrypted pass-through FUSE file system
build_deps :
	 cmake
	 pkg-config
link_deps :
	 boost
	 gettext
	 openssl
	 :osxfuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end

name :
	 Libgit2
homepage :
	 https://libgit2.github.com/
url :
	 https://github.com/libgit2/libgit2/archive/v0.27.7.tar.gz
description :
	 C library of Git core methods that is re-entrant and linkable
build_deps :
	 cmake
	 pkg-config
link_deps :
	 openssl
	 libssh2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DBUILD_EXAMPLES=YES"
	 args << "-DBUILD_CLAR=NO"
	 args << "-DUSE_SSH=NO" if build.without? "libssh2"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make", "install"
	 cd "examples" do
	 (pkgshare/"examples").install "add", "blame", "cat-file", "cgit2",
	 "describe", "diff", "for-each-ref",
	 "general", "init", "log", "remote",
	 "rev-list", "rev-parse", "showindex",
	 "status", "tag"
	 end
	 system "make", "clean"
	 system "cmake", "..", "-DBUILD_SHARED_LIBS=OFF", *args
	 system "make"
	 lib.install "libgit2.a"
	 end

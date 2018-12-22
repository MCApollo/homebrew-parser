name :
	 Sysdig
homepage :
	 https://www.sysdig.org/
url :
	 https://github.com/draios/sysdig/archive/0.24.1.tar.gz
description :
	 System-level exploration and troubleshooting tool
build_deps :
	 cmake
link_deps :
	 jsoncpp
	 luajit
conflicts :
patches :
EOF_patch :
install :
	 ENV.libcxx if MacOS.version < :mavericks
	 mkdir "build" do
	 system "cmake", "..", "-DSYSDIG_VERSION=#{version}",
	 "-DUSE_BUNDLED_DEPS=OFF",
	 *std_cmake_args
	 system "make", "install"
	 end
	 (pkgshare/"demos").install resource("sample_file").files("sample.scap")

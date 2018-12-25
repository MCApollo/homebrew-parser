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
optional_deps :
conflicts :
resource :
	 ['sample_file']
	 ['https://gist.githubusercontent.com/juniorz/9986999/raw/a3556d7e93fa890a157a33f4233efaf8f5e01a6f/sample.scap']
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

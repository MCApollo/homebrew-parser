name :
	 Tarantool
homepage :
	 https://tarantool.org/
url :
	 https://download.tarantool.org/tarantool/1.10/src/tarantool-1.10.2.1.tar.gz
description :
	 In-memory database and Lua application server
build_deps :
	 cmake
link_deps :
	 icu4c
	 openssl
	 readline
conflicts :
patches :
EOF_patch :
install :
	 sdk = MacOS::CLT.installed? ? "" : MacOS.sdk_path
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 args = std_cmake_args
	 args << "-DCMAKE_INSTALL_MANDIR=#{doc}"
	 args << "-DCMAKE_INSTALL_SYSCONFDIR=#{etc}"
	 args << "-DCMAKE_INSTALL_LOCALSTATEDIR=#{var}"
	 args << "-DENABLE_DIST=ON"
	 args << "-DOPENSSL_ROOT_DIR=#{Formula["openssl"].opt_prefix}"
	 args << "-DREADLINE_ROOT=#{Formula["readline"].opt_prefix}"
	 args << "-DCURL_INCLUDE_DIR=#{sdk}/usr/include"
	 args << "-DCURL_LIBRARY=/usr/lib/libcurl.dylib"
	 system "cmake", ".", *args
	 system "make"
	 system "make", "install"
	 local_user = ENV["USER"]
	 inreplace etc/"default/tarantool", /(username\s*=).*/, "\\1 '#{local_user}'"
	 (var/"lib/tarantool").mkpath
	 (var/"log/tarantool").mkpath
	 (var/"run/tarantool").mkpath

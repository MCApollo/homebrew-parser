name :
	 Arangodb
homepage :
	 https://www.arangodb.com/
url :
	 https://download.arangodb.com/Source/ArangoDB-3.4.0.tar.gz
description :
	 The Multi-Model NoSQL Database
build_deps :
	 cmake
	 go
link_deps :
	 :macos
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 mkdir "build" do
	 args = std_cmake_args + %W[
	 -DHOMEBREW=ON
	 -DUSE_OPTIMIZE_FOR_ARCHITECTURE=OFF
	 -DASM_OPTIMIZATIONS=OFF
	 -DCMAKE_INSTALL_DATADIR=#{share}
	 -DCMAKE_INSTALL_DATAROOTDIR=#{share}
	 -DCMAKE_INSTALL_SYSCONFDIR=#{etc}
	 -DCMAKE_INSTALL_LOCALSTATEDIR=#{var}
	 ]
	 if ENV.compiler == "gcc-6"
	 ENV.append "V8_CXXFLAGS", "-O3 -g -fno-delete-null-pointer-checks"
	 end
	 system "cmake", "..", *args
	 system "make", "install"
	 %w[arangod arango-dfdb arangosh foxx-manager].each do |f|
	 inreplace etc/"arangodb3/#{f}.conf", pkgshare, opt_pkgshare
	 end
	 end
	 (var/"lib/arangodb3").mkpath
	 (var/"log/arangodb3").mkpath

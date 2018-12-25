name :
	 Wireshark
homepage :
	 https://www.wireshark.org
url :
	 https://www.wireshark.org/download/src/all-versions/wireshark-2.6.5.tar.xz
description :
	 Graphical network analyzer and capture tool
build_deps :
	 cmake
link_deps :
	 c-ares
	 glib
	 gnutls
	 libgcrypt
	 libmaxminddb
	 libsmi
	 libssh
	 lua@5.1
	 nghttp2
optional_deps :
	 qt
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = std_cmake_args + %W[
	 -DENABLE_CARES=ON
	 -DENABLE_GNUTLS=ON
	 -DENABLE_MAXMINDDB=ON
	 -DBUILD_wireshark_gtk=OFF
	 -DENABLE_PORTAUDIO=OFF
	 -DENABLE_LUA=ON
	 -DLUA_INCLUDE_DIR=#{Formula["lua@5.1"].opt_include}/lua-5.1
	 -DLUA_LIBRARY=#{Formula["lua@5.1"].opt_lib}/liblua5.1.dylib
	 -DCARES_INCLUDE_DIR=#{Formula["c-ares"].opt_include}
	 -DGCRYPT_INCLUDE_DIR=#{Formula["libgcrypt"].opt_include}
	 -DGNUTLS_INCLUDE_DIR=#{Formula["gnutls"].opt_include}
	 -DMAXMINDDB_INCLUDE_DIR=#{Formula["libmaxminddb"].opt_include}
	 -DENABLE_SMI=ON
	 -DBUILD_sshdump=ON
	 -DBUILD_ciscodump=ON
	 -DENABLE_NGHTTP2=ON
	 ]
	 if build.with? "qt"
	 args << "-DBUILD_wireshark=ON"
	 args << "-DENABLE_APPLICATION_BUNDLE=ON"
	 args << "-DENABLE_QT5=ON"
	 else
	 args << "-DBUILD_wireshark=OFF"
	 args << "-DENABLE_APPLICATION_BUNDLE=OFF"
	 args << "-DENABLE_QT5=OFF"
	 end
	 system "cmake", *args
	 system "make", "install"
	 if build.with? "qt"
	 prefix.install bin/"Wireshark.app"
	 bin.install_symlink prefix/"Wireshark.app/Contents/MacOS/Wireshark" => "wireshark"
	 end
	 (include/"wireshark").install Dir["*.h"]
	 (include/"wireshark/epan").install Dir["epan/*.h"]
	 (include/"wireshark/epan/crypt").install Dir["epan/crypt/*.h"]
	 (include/"wireshark/epan/dfilter").install Dir["epan/dfilter/*.h"]
	 (include/"wireshark/epan/dissectors").install Dir["epan/dissectors/*.h"]
	 (include/"wireshark/epan/ftypes").install Dir["epan/ftypes/*.h"]
	 (include/"wireshark/epan/wmem").install Dir["epan/wmem/*.h"]
	 (include/"wireshark/wiretap").install Dir["wiretap/*.h"]
	 (include/"wireshark/wsutil").install Dir["wsutil/*.h"]

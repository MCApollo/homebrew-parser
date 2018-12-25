name :
	 Qca
homepage :
	 https://userbase.kde.org/QCA
url :
description :
	 Qt Cryptographic Architecture (QCA)
build_deps :
	 cmake
	 pkg-config
link_deps :
	 openssl
	 qt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/KDE/qca/commit/b435c1b87b14ac2d2de9f83e586bfd6d8c2a755e.diff?full_index=1
	 https://github.com/KDE/qca/commit/f4b2eb0ced5310f3c43398eb1f03e0c065e08a82.diff?full_index=1
	 https://github.com/KDE/qca/pull/3.patch?full_index=1
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DQT4_BUILD=OFF"
	 args << "-DBUILD_TESTS=OFF"
	 args << "-DQCA_PLUGINS_INSTALL_DIR=#{lib}/qt5/plugins"
	 args << "-DWITH_botan_PLUGIN=NO"
	 args << "-DWITH_gcrypt_PLUGIN=NO"
	 args << "-DWITH_gnupg_PLUGIN=NO"
	 args << "-DWITH_nss_PLUGIN=NO"
	 args << "-DWITH_pkcs11_PLUGIN=NO"
	 inreplace "src/CMakeLists.txt",
	 /^(\s+)(INSTALL_NAME_DIR )("\$\{QCA_LIBRARY_INSTALL_DIR\}")$/,
	 "\\1\\2\"#{opt_lib}\""
	 system "cmake", ".", *args
	 system "make", "install"

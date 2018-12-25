name :
	 AzureStorageCpp
homepage :
	 https://azure.github.io/azure-storage-cpp
url :
	 https://github.com/Azure/azure-storage-cpp/archive/v5.2.0.tar.gz
description :
	 Microsoft Azure Storage Client Library for C++
build_deps :
	 cmake
link_deps :
	 boost
	 cpprestsdk
	 gettext
	 openssl
	 ossp-uuid
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", "Microsoft.WindowsAzure.Storage",
	 "-DBUILD_SAMPLES=OFF",
	 "-DBUILD_TESTS=OFF",
	 *std_cmake_args
	 system "make", "install"

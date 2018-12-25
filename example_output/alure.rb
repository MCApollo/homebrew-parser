name :
	 Alure
homepage :
	 https://kcat.strangesoft.net/alure.html
url :
	 https://kcat.strangesoft.net/alure-releases/alure-1.2.tar.bz2
description :
	 Manage common tasks with OpenAL applications
build_deps :
	 cmake
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/eed63e836e/alure/unistd.patch
EOF_patch :
install :
	 cd "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end

name :
	 Gammu
homepage :
	 https://wammu.eu/gammu/
url :
	 https://dl.cihar.com/gammu/releases/gammu-1.39.0.tar.xz
description :
	 Command-line utility to control a phone
build_deps :
	 cmake
link_deps :
	 glib
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DBASH_COMPLETION_COMPLETIONSDIR:PATH=#{bash_completion}", *std_cmake_args
	 system "make", "install"
	 end

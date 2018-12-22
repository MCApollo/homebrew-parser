name :
	 Dfc
homepage :
	 https://projects.gw-computing.net/projects/dfc
url :
	 https://projects.gw-computing.net/attachments/download/615/dfc-3.1.1.tar.gz
description :
	 Display graphs and colors of file system space/usage
build_deps :
	 cmake
link_deps :
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end

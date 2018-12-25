name :
	 Chicken
homepage :
	 https://www.call-cc.org/
url :
	 https://code.call-cc.org/releases/5.0.0/chicken-5.0.0.tar.gz
description :
	 Compiler for the Scheme programming language
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 args = %W[
	 PLATFORM=macosx
	 PREFIX=#{prefix}
	 C_COMPILER=#{ENV.cc}
	 LIBRARIAN=ar
	 POSTINSTALL_PROGRAM=install_name_tool
	 ]
	 args << "ARCH=x86-64" if MacOS.prefer_64_bit?
	 system "make", *args
	 system "make", "install", *args

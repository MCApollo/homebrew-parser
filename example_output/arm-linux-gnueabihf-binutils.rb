name :
	 ArmLinuxGnueabihfBinutils
homepage :
	 https://www.gnu.org/software/binutils/binutils.html
url :
	 https://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.gz
description :
	 FSF/GNU binutils for cross-compiling to arm-linux
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
	 ENV.cxx11
	 ENV.append "CXXFLAGS", "-Wno-c++11-narrowing"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--enable-deterministic-archives",
	 "--prefix=#{prefix}",
	 "--disable-werror",
	 "--target=arm-linux-gnueabihf",
	 "--enable-gold=yes",
	 "--enable-ld=yes",
	 "--enable-interwork"
	 system "make"
	 system "make", "install"

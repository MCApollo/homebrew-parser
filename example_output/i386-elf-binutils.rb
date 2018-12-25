name :
	 I386ElfBinutils
homepage :
	 https://www.gnu.org/software/binutils/
url :
	 https://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.xz
description :
	 FSF Binutils for i386-elf cross development
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
	 system "./configure", "--target=i386-elf",
	 "--disable-multilib",
	 "--disable-nls",
	 "--disable-werror",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"

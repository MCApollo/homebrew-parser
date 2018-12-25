name :
	 I386ElfGcc
homepage :
	 https://gcc.gnu.org
url :
	 https://mirrors.nju.edu.cn/gnu/gcc/gcc-8.2.0/gcc-8.2.0.tar.xz
description :
	 The GNU compiler collection for i386-elf
build_deps :
link_deps :
	 gmp
	 i386-elf-binutils
	 libmpc
	 mpfr
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "i386-elf-gcc-build" do
	 system "../configure", "--target=i386-elf",
	 "--prefix=#{prefix}",
	 "--without-isl",
	 "--disable-multilib",
	 "--disable-nls",
	 "--disable-werror",
	 "--without-headers",
	 "--with-as=#{Formula["i386-elf-binutils"].bin}/i386-elf-as",
	 "--with-ld=#{Formula["i386-elf-binutils"].bin}/i386-elf-ld",
	 "--enable-languages=c,c++"
	 system "make", "all-gcc"
	 system "make", "install-gcc"
	 system "make", "all-target-libgcc"
	 system "make", "install-target-libgcc"
	 end

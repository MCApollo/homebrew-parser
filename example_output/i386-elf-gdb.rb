name :
	 I386ElfGdb
homepage :
	 https://www.gnu.org/software/gdb/
url :
	 https://ftp.gnu.org/gnu/gdb/gdb-8.2.tar.xz
description :
	 GNU debugger for i386-elf cross development
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "../configure", "--target=i386-elf",
	 "--prefix=#{prefix}",
	 "--disable-werror"
	 system "make"
	 system "make", "install"
	 end

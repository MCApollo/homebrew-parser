name :
	 Binutils
homepage :
	 https://www.gnu.org/software/binutils/binutils.html
url :
	 https://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.gz
description :
	 FSF/GNU ld, ar, readelf, etc. for native development
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/91dc37fa4609cf1d040b5ede9f2eb971f3730597/binutils/add_mach_o_command.patch
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--enable-deterministic-archives",
	 "--prefix=#{prefix}",
	 "--infodir=#{info}",
	 "--mandir=#{man}",
	 "--disable-werror",
	 "--enable-interwork",
	 "--enable-multilib",
	 "--enable-64-bit-bfd",
	 "--enable-targets=all"
	 system "make"
	 system "make", "install"
	 Dir["#{bin}/*"].each do |f|
	 bin.install_symlink f => "g" + File.basename(f)

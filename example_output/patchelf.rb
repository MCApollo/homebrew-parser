name :
	 Patchelf
homepage :
	 https://nixos.org/patchelf.html
url :
	 https://nixos.org/releases/patchelf/patchelf-0.9/patchelf-0.9.tar.gz
description :
	 Modify dynamic ELF executables
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules"
	 system "make", "install"

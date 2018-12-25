name :
	 Cdparanoia
homepage :
	 https://www.xiph.org/paranoia/
url :
	 https://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-10.2.src.tgz
description :
	 Audio extraction tool for sampling CDs
build_deps :
	 autoconf
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/2a22152/cdparanoia/osx_interface.patch
EOF_patch :
install :
	 system "autoconf"
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--libdir=#{libexec}"
	 system "make", "all"
	 system "make", "install"

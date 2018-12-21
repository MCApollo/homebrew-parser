name :
	 Bochs
homepage :
	 https://bochs.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/bochs/bochs/2.6.9/bochs-2.6.9.tar.gz
description :
	 Open source IA-32 (x86) PC emulator written in C++
build_deps :
	 pkg-config
link_deps :
	 sdl2
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e9b520dd4c/bochs/xcode9.patch
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --with-nogui
	 --enable-disasm
	 --disable-docbook
	 --enable-x86-64
	 --enable-pci
	 --enable-all-optimizations
	 --enable-plugins
	 --enable-cdrom
	 --enable-a20-pin
	 --enable-fpu
	 --enable-alignment-check
	 --enable-large-ramfile
	 --enable-debugger-gui
	 --enable-readline
	 --enable-iodebug
	 --enable-show-ips
	 --enable-logging
	 --enable-usb
	 --enable-cpu-level=6
	 --enable-clgd54xx
	 --enable-avx
	 --enable-vmx=2
	 --enable-long-phy-address
	 --with-term
	 ]
	 args << "--with-sdl2" if build.with? "sdl2"
	 if build.with? "gdb-stub"
	 args << "--enable-gdb-stub"
	 else
	 args << "--enable-debugger"
	 args << "--enable-smp"

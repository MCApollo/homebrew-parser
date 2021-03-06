name :
	 Qemu
homepage :
	 https://www.qemu.org/
url :
	 https://download.qemu.org/qemu-3.1.0.tar.xz
description :
	 x86 and PowerPC Emulator
build_deps :
	 libtool
	 pkg-config
link_deps :
	 glib
	 gnutls
	 jpeg
	 ncurses
	 pixman
	 libpng
optional_deps :
	 gtk+3
	 libssh2
	 libusb
	 sdl2
	 vde
conflicts :
resource :
	 ['test-image']
	 ['https://dl.bintray.com/homebrew/mirror/FD12FLOPPY.zip']
patches :
EOF_patch :
install :
	 ENV["LIBTOOL"] = "glibtool"
	 args = %W[
	 --prefix=#{prefix}
	 --cc=#{ENV.cc}
	 --host-cc=#{ENV.cc}
	 --disable-bsd-user
	 --disable-guest-agent
	 --enable-curses
	 --extra-cflags=-DNCURSES_WIDECHAR=1
	 ]
	 if build.with?("sdl2") || build.with?("gtk+3")
	 args << "--disable-cocoa"
	 else
	 args << "--enable-cocoa"
	 end
	 args << "--smbd=#{HOMEBREW_PREFIX}/sbin/samba-dot-org-smbd"
	 args << (build.with?("vde") ? "--enable-vde" : "--disable-vde")
	 args << (build.with?("sdl2") ? "--enable-sdl" : "--disable-sdl")
	 args << (build.with?("gtk+3") ? "--enable-gtk" : "--disable-gtk")
	 args << (build.with?("libssh2") ? "--enable-libssh2" : "--disable-libssh2")
	 system "./configure", *args
	 system "make", "V=1", "install"

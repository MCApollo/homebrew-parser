name :
	 Opencbm
homepage :
	 https://spiro.trikaliotis.net/opencbm-alpha
url :
	 https://spiro.trikaliotis.net/Download/opencbm-0.4.99.99/opencbm-0.4.99.99.tar.bz2
description :
	 Provides access to various floppy drive formats
build_deps :
	 cc65
link_deps :
	 libusb-compat
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/48bd0fd/opencbm/endian.diff
EOF_patch :
install :
	 ENV.deparallelize
	 args = %W[
	 -fLINUX/Makefile
	 LIBUSB_CONFIG=#{Formula["libusb-compat"].bin}/libusb-config
	 PREFIX=#{prefix}
	 MANDIR=#{man1}
	 ]
	 system "make", *args
	 system "make", "install-all", *args

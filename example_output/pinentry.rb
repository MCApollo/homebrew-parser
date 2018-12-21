name :
	 Pinentry
homepage :
	 https://www.gnupg.org/related_software/pinentry/
url :
	 https://www.gnupg.org/ftp/gcrypt/pinentry/pinentry-1.1.0.tar.bz2
description :
	 Passphrase entry dialog utilizing the Assuan protocol
build_deps :
	 pkg-config
link_deps :
	 libassuan
	 libgpg-error
	 gtk+
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --disable-pinentry-qt
	 --disable-pinentry-qt5
	 --disable-pinentry-gnome3
	 --disable-pinentry-tqt
	 --disable-pinentry-fltk
	 --enable-pinentry-tty
	 ]
	 args << "--disable-pinentry-gtk2" if build.without? "gtk+"
	 system "./configure", *args
	 system "make", "install"

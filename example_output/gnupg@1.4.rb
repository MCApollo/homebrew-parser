name :
	 GnupgAT14
homepage :
	 https://www.gnupg.org/
url :
	 https://gnupg.org/ftp/gcrypt/gnupg/gnupg-1.4.23.tar.bz2
description :
	 GNU Pretty Good Privacy (PGP) package
build_deps :
link_deps :
	 curl
	 libusb-compat
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --disable-asm
	 --program-suffix=1
	 ]
	 args << "--with-libusb=no" if build.without? "libusb-compat"
	 system "./configure", *args
	 system "make"
	 system "make", "check"
	 [bin, libexec/"gnupg"].each(&:mkpath)
	 system "make", "install"
	 inreplace bin/"gpg-zip1", "GPG=gpg", "GPG=gpg1"
	 %w[curl finger hkp ldap].each do |cmd|
	 cmd.prepend("gpgkeys_")
	 (libexec/"gnupg").install_symlink (cmd + "1") => cmd

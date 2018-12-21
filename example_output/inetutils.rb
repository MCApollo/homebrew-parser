name :
	 Inetutils
homepage :
	 https://www.gnu.org/software/inetutils/
url :
	 https://ftp.gnu.org/gnu/inetutils/inetutils-1.9.4.tar.xz
description :
	 GNU utilities for networking
build_deps :
link_deps :
	 libidn
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --with-idn
	 ]
	 args << "--program-prefix=g" if build.without? "default-names"
	 system "./configure", *args
	 system "make", "install"
	 if build.without? "default-names"
	 noshadow.each do |cmd|
	 bin.install_symlink "g#{cmd}" => cmd
	 man1.install_symlink "g#{cmd}.1" => "#{cmd}.1"

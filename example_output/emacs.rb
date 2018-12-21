name :
	 Emacs
homepage :
	 https://www.gnu.org/software/emacs/
url :
	 https://ftp.gnu.org/gnu/emacs/emacs-26.1.tar.xz
description :
	 GNU Emacs text editor
build_deps :
	 pkg-config
link_deps :
	 gnutls
	 dbus
	 imagemagick@6
	 librsvg
	 mailutils
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --enable-locallisppath=#{HOMEBREW_PREFIX}/share/emacs/site-lisp
	 --infodir=#{info}/emacs
	 --prefix=#{prefix}
	 --with-gnutls
	 --without-x
	 ]
	 if build.with? "libxml2"
	 args << "--with-xml2"
	 else
	 args << "--without-xml2"

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
	 end
	 if build.with? "dbus"
	 args << "--with-dbus"
	 else
	 args << "--without-dbus"
	 end
	 if build.with? "imagemagick@6"
	 args << "--with-imagemagick"
	 else
	 args << "--without-imagemagick"
	 end
	 args << "--with-modules" if build.with? "modules"
	 args << "--with-rsvg" if build.with? "librsvg"
	 args << "--without-pop" if build.with? "mailutils"
	 if build.head?
	 ENV.prepend_path "PATH", Formula["gnu-sed"].opt_libexec/"gnubin"
	 system "./autogen.sh"
	 end
	 if build.with? "cocoa"
	 args << "--with-ns" << "--disable-ns-self-contained"
	 else
	 args << "--without-ns"
	 end
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 if build.with? "cocoa"
	 prefix.install "nextstep/Emacs.app"
	 (bin/"emacs").unlink
	 (bin/"emacs").write <<~EOS
	 #!/bin/bash
	 exec #{prefix}/Emacs.app/Contents/MacOS/Emacs "$@"
	 EOS
	 end
	 if build.without? "ctags"
	 (bin/"ctags").unlink
	 (man1/"ctags.1.gz").unlink
	 end

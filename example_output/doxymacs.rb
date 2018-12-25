name :
	 Doxymacs
homepage :
	 https://doxymacs.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/doxymacs/doxymacs/1.8.0/doxymacs-1.8.0.tar.gz
description :
	 Elisp package for using doxygen under Emacs
build_deps :
link_deps :
	 doxygen
	 emacs
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
	 end
	 ENV.append "CFLAGS", "-std=gnu89"
	 ENV.prepend_path "PATH", "#{MacOS.sdk_path}/usr/bin"
	 system "./bootstrap" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--with-lispdir=#{elisp}",
	 "--disable-debug",
	 "--disable-dependency-tracking"
	 system "make", "install"

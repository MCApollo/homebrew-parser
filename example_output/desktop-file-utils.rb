name :
	 DesktopFileUtils
homepage :
	 https://wiki.freedesktop.org/www/Software/desktop-file-utils/
url :
	 https://www.freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-0.23.tar.xz
description :
	 Command-line utilities for working with desktop entries
build_deps :
	 pkg-config
link_deps :
	 glib
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-lispdir=#{elisp}"
	 system "make", "install"

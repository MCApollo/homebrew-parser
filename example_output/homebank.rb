name :
	 Homebank
homepage :
	 http://homebank.free.fr
url :
	 http://homebank.free.fr/public/homebank-5.2.2.tar.gz
description :
	 Manage your personal accounts at home
build_deps :
	 intltool
	 pkg-config
link_deps :
	 adwaita-icon-theme
	 fontconfig
	 freetype
	 gettext
	 gtk+3
	 hicolor-icon-theme
	 libofx
	 libsoup
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--with-ofx"
	 chmod 0755, "./install-sh"
	 system "make", "install"

name :
	 Gettext
homepage :
	 https://www.gnu.org/software/gettext/
url :
	 https://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz
description :
	 GNU internationalization (i18n) and localization (l10n) library
build_deps :
link_deps :
	 libxml2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--disable-debug",
	 "--prefix=#{prefix}",
	 "--with-included-gettext",
	 "--with-included-glib",
	 "--with-included-libcroco",
	 "--with-included-libunistring",
	 "--with-emacs",
	 "--with-lispdir=#{elisp}",
	 "--disable-java",
	 "--disable-csharp",
	 "--without-git",
	 "--without-cvs",
	 "--without-xz"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"

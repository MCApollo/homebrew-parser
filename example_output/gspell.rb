name :
	 Gspell
homepage :
	 https://wiki.gnome.org/Projects/gspell
url :
	 https://download.gnome.org/sources/gspell/1.8/gspell-1.8.1.tar.xz
description :
	 Flexible API to implement spellchecking in GTK+ applications
build_deps :
	 autoconf
	 automake
	 gtk-doc
	 libtool
	 pkg-config
link_deps :
	 enchant
	 gtk+3
	 gtk-mac-integration
	 iso-codes
	 vala
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/gspell/Makefile.am b/gspell/Makefile.am
	 index 076a9fd..6c67184 100644
	 --- a/gspell/Makefile.am
	 +++ b/gspell/Makefile.am
	 @@ -91,6 +91,7 @@ nodist_libgspell_core_la_SOURCES = \
	 $(BUILT_SOURCES)
	 libgspell_core_la_LIBADD =	\
	 +	$(GTK_MAC_LIBS)		\
	 $(CODE_COVERAGE_LIBS)
	 libgspell_core_la_CFLAGS =	\
	 @@ -155,6 +156,12 @@ gspell_private_headers += \
	 gspell_private_c_files += \
	 gspell-osx.c
	 +libgspell_core_la_CFLAGS += \
	 +	-xobjective-c
	 +
	 +libgspell_core_la_LDFLAGS += \
	 +	-framework Cocoa
	 +
	 endif
	 if HAVE_INTROSPECTION
install :
	 system "autoreconf", "-i"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"

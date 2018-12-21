name :
	 Gobby
homepage :
	 https://gobby.github.io/
url :
	 http://releases.0x539.de/gobby/gobby-0.5.0.tar.gz
description :
	 Multi-platform collaborative text editor
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 gnutls
	 gsasl
	 gtkmm3
	 gtksourceview3
	 hicolor-icon-theme
	 libinfinity
	 libxml++
conflicts :
patches :
EOF_patch :
	 diff --git a/code/core/header.cpp b/code/core/header.cpp
	 index eba2fb1..510608e 100644
	 --- a/code/core/header.cpp
	 +++ b/code/core/header.cpp
	 @@ -24,10 +24,6 @@
	 #include <gtksourceview/gtksourcelanguage.h>
	 #include <gdk/gdkkeysyms.h>
	 -#ifdef PLATFORM_OSX_NATIVE
	 -#include <ige-mac-menu.h>
	 -#endif
	 -
	 namespace {
	 Glib::ustring ui_desc =
	 "<ui>"
	 @@ -519,28 +515,7 @@ Gobby::Header::Header(Preferences& preferences,
	 );
	 }
	 -#ifdef PLATFORM_OSX_NATIVE
	 -	ige_mac_menu_set_menu_bar(GTK_MENU_SHELL(m_menubar->gobj()));
	 -
	 -	ige_mac_menu_set_quit_menu_item(GTK_MENU_ITEM(
	 -		m_ui_manager->get_widget(
	 -			"/MenuMainBar/MenuFile/FileQuit")->gobj()));
	 -
	 -	ige_mac_menu_add_app_menu_item(
	 -		ige_mac_menu_add_app_menu_group(), GTK_MENU_ITEM(
	 -			m_ui_manager->get_widget(
	 -				"/MenuMainBar/MenuHelp/HelpAbout")->gobj()),
	 -		NULL);
	 -
	 -	 ige_mac_menu_add_app_menu_item(
	 -	 	ige_mac_menu_add_app_menu_group(), GTK_MENU_ITEM(
	 -			m_ui_manager->get_widget(
	 -				"/MenuMainBar/MenuEdit/EditPreferences")
	 -			->gobj()),
	 -		NULL);
	 -#else
	 pack_start(*m_menubar, Gtk::PACK_SHRINK);
	 -#endif
	 pack_start(*m_toolbar, Gtk::PACK_SHRINK);
	 m_toolbar->set_toolbar_style(preferences.appearance.toolbar_style);
	 diff --git a/configure b/configure
	 index 7dabb26..0987444 100755
	 --- a/configure
	 +++ b/configure
	 @@ -4955,7 +4955,7 @@ $as_echo "#define PLATFORM_OSX 1" >>confdefs.h
	 $as_echo "#define PLATFORM_OSX_NATIVE 1" >>confdefs.h
	 -    required_libs="$required_libs ige-mac-integration"
	 +    required_libs="$required_libs"
	 fi
	 fi
	 cat >confcache <<\_ACEOF
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}", "--with-gtk3"
	 system "make", "install"

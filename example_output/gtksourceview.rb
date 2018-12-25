name :
	 Gtksourceview
homepage :
	 https://projects.gnome.org/gtksourceview/
url :
	 https://download.gnome.org/sources/gtksourceview/2.10/gtksourceview-2.10.5.tar.gz
description :
	 Text view with syntax, undo/redo, and text marks
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 gtk+
	 gtk-mac-integration
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/configure b/configure
	 index ed522e5..5f51d4f 100755
	 --- a/configure
	 +++ b/configure
	 @@ -11220,12 +11220,12 @@ if test -n "$IGE_MAC_CFLAGS"; then
	 pkg_cv_IGE_MAC_CFLAGS="$IGE_MAC_CFLAGS"
	 elif test -n "$PKG_CONFIG"; then
	 if test -n "$PKG_CONFIG" && \
	 -    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"ige-mac-integration\""; } >&5
	 -  ($PKG_CONFIG --exists --print-errors "ige-mac-integration") 2>&5
	 +    { { $as_echo "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"gtk-mac-integration-gtk2\""; } >&5
	 +  ($PKG_CONFIG --exists --print-errors "gtk-mac-integration-gtk2") 2>&5
	 ac_status=$?
	 $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"

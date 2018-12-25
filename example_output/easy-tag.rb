name :
	 EasyTag
homepage :
	 https://projects.gnome.org/easytag
url :
	 https://download.gnome.org//sources/easytag/2.4/easytag-2.4.3.tar.xz
description :
	 Application for viewing and editing audio file tags
build_deps :
	 intltool
	 itstool
	 pkg-config
link_deps :
	 adwaita-icon-theme
	 flac
	 gtk+3
	 hicolor-icon-theme
	 id3lib
	 libid3tag
	 libogg
	 libvorbis
	 speex
	 taglib
	 wavpack
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/Makefile.in b/Makefile.in
	 index 9dbde5f..4ffe52e 100644
	 --- a/Makefile.in
	 +++ b/Makefile.in
	 @@ -3960,8 +3960,6 @@ data/org.gnome.EasyTAG.gschema.valid: data/.dstamp
	 @ENABLE_MAN_TRUE@		--path $(builddir)/doc --output $(builddir)/doc/ \
	 @ENABLE_MAN_TRUE@		http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl $<
	 -install-data-hook: install-update-icon-cache
	 -uninstall-hook: uninstall-update-icon-cache
	 install-update-icon-cache:
	 $(AM_V_at)$(POST_INSTALL)
install :
	 ENV.append_path "PYTHONPATH", "#{Formula["libxml2"].opt_lib}/python2.7/site-packages"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-schemas-compile"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"

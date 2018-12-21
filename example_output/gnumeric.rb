name :
	 Gnumeric
homepage :
	 https://projects.gnome.org/gnumeric/
url :
	 https://download.gnome.org/sources/gnumeric/1.12/gnumeric-1.12.43.tar.xz
description :
	 GNOME Spreadsheet Application
build_deps :
	 intltool
	 pkg-config
link_deps :
	 adwaita-icon-theme
	 gettext
	 goffice
	 pygobject
	 rarian
conflicts :
patches :
EOF_patch :
install :
	 resource("py_libxml2").stage do
	 cd "python" do
	 system "python", "setup.py", "install", "--prefix=#{buildpath}/vendor"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"

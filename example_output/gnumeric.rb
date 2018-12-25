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
optional_deps :
conflicts :
resource :
	 ['itstool', 'py_libxml2']
	 ['http://files.itstool.org/itstool/itstool-2.0.2.tar.bz2', 'http://xmlsoft.org/sources/libxml2-2.9.7.tar.gz']
patches :
EOF_patch :
install :
	 resource("py_libxml2").stage do
	 cd "python" do
	 system "python", "setup.py", "install", "--prefix=#{buildpath}/vendor"
	 end
	 end
	 resource("itstool").stage do
	 ENV.append_path "PYTHONPATH", "#{buildpath}/vendor/lib/python2.7/site-packages"
	 system "./configure", "--prefix=#{buildpath}/vendor"
	 system "make", "install"
	 end
	 ENV.prepend_path "PATH", buildpath/"vendor/bin"
	 inreplace "component/Makefile.in",
	 "GOFFICE_PLUGINS_DIR = @GOFFICE_PLUGINS_DIR@",
	 "GOFFICE_PLUGINS_DIR = @libdir@/goffice/@GOFFICE_API_VER@/plugins/gnumeric"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-schemas-compile"
	 system "make", "install"
	 system "#{Formula["glib"].opt_bin}/glib-compile-schemas", "#{HOMEBREW_PREFIX}/share/glib-2.0/schemas"

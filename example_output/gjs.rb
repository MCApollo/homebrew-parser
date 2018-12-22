name :
	 Gjs
homepage :
	 https://gitlab.gnome.org/GNOME/gjs/wikis/Home
url :
	 https://download.gnome.org/sources/gjs/1.54/gjs-1.54.3.tar.xz
description :
	 JavaScript Bindings for GNOME
build_deps :
	 autoconf@2.13
	 pkg-config
link_deps :
	 gobject-introspection
	 gtk+3
	 nspr
	 readline
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV["_MACOSX_DEPLOYMENT_TARGET"] = ENV["MACOSX_DEPLOYMENT_TARGET"]
	 resource("mozjs60").stage do
	 inreplace "config/rules.mk",
	 "-install_name $(_LOADER_PATH)/$(SHARED_LIBRARY) ",
	 "-install_name #{lib}/$(SHARED_LIBRARY) "
	 inreplace "old-configure", "-Wl,-executable_path,${DIST}/bin", ""
	 mkdir("build") do
	 ENV["PYTHON"] = "python"
	 system "../js/src/configure", "--prefix=#{prefix}",
	 "--with-system-nspr",
	 "--with-system-zlib",
	 "--with-system-icu",
	 "--enable-readline",
	 "--enable-shared-js",
	 "--with-pthreads",
	 "--enable-optimize",
	 "--enable-pie",
	 "--enable-release",
	 "--with-intl-api",
	 "--disable-jemalloc"
	 system "make"
	 system "make", "install"
	 rm Dir["#{bin}/*"]
	 end
	 cd(include.to_s) do
	 `find . -type l`.chomp.split.each do |link|
	 header = File.readlink(link)
	 rm link
	 cp header, link
	 end
	 end
	 ENV.append_path "PKG_CONFIG_PATH", "#{lib}/pkgconfig"
	 rm "#{lib}/libjs_static.ajs"
	 end
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--without-dbus-tests",
	 "--disable-profiler",
	 "--prefix=#{prefix}"
	 system "make", "install"

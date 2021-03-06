name :
	 YelpTools
homepage :
	 https://github.com/GNOME/yelp-tools
url :
	 https://download.gnome.org/sources/yelp-tools/3.28/yelp-tools-3.28.0.tar.xz
description :
	 Tools that help create and edit Mallard or DocBook documentation
build_deps :
	 gettext
	 intltool
	 itstool
	 libxml2
	 libxslt
	 pkg-config
link_deps :
	 gtk+3
optional_deps :
conflicts :
resource :
	 ['yelp-xsl']
	 ['https://download.gnome.org/sources/yelp-xsl/3.30/yelp-xsl-3.30.1.tar.xz']
patches :
EOF_patch :
install :
	 resource("yelp-xsl").stage do
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 ENV.append_path "PKG_CONFIG_PATH", "#{share}/pkgconfig"
	 end
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache",
	 "-f", "-t", "#{HOMEBREW_PREFIX}/share/icons/hicolor"

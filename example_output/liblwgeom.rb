name :
	 Liblwgeom
homepage :
	 https://postgis.net/
url :
	 https://download.osgeo.org/postgis/source/postgis-2.4.4.tar.gz
description :
	 Allows SpatiaLite to support ST_MakeValid() like PostGIS
build_deps :
	 autoconf
	 automake
	 gpp
	 libtool
	 pkg-config
link_deps :
	 geos
	 json-c
	 proj
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 args = [
	 "--disable-dependency-tracking",
	 "--disable-nls",
	 "--with-projdir=#{HOMEBREW_PREFIX}",
	 "--with-jsondir=#{Formula["json-c"].opt_prefix}",
	 "--without-pgconfig",
	 "--without-libiconv-prefix",
	 "--without-libintl-prefix",
	 "--without-raster",
	 "--without-topology",
	 ]
	 system "./autogen.sh"
	 system "./configure", *args
	 mkdir "stage"
	 cd "liblwgeom" do
	 system "make", "install", "DESTDIR=#{buildpath}/stage"
	 end
	 lib.install Dir["stage/**/lib/*"]
	 include.install Dir["stage/**/include/*"]

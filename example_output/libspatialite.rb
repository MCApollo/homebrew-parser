name :
	 Libspatialite
homepage :
	 https://www.gaia-gis.it/fossil/libspatialite/index
url :
	 https://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-4.3.0a.tar.gz
description :
	 Adds spatial SQL capabilities to SQLite
build_deps :
	 pkg-config
link_deps :
	 freexl
	 geos
	 libxml2
	 proj
	 sqlite
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/27a0e51936e01829d0a6f3c75a7fbcaf92bb133f/libspatialite/sqlite310.patch
EOF_patch :
install :
	 system "autoreconf", "-fi" if build.head?
	 inreplace "configure",
	 "shrext_cmds='`test .$module = .yes && echo .so || echo .dylib`'",
	 "shrext_cmds='.dylib'"
	 sqlite = Formula["sqlite"]
	 ENV.append "LDFLAGS", "-L#{sqlite.opt_lib}"
	 ENV.append "CFLAGS", "-I#{sqlite.opt_include}"
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --with-sysroot=#{HOMEBREW_PREFIX}
	 --enable-geocallbacks
	 ]
	 system "./configure", *args
	 system "make", "install"

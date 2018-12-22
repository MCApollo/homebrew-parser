name :
	 Gdal
homepage :
	 https://www.gdal.org/
url :
	 https://download.osgeo.org/gdal/2.3.1/gdal-2.3.1.tar.xz
description :
	 Geospatial Data Abstraction Library
build_deps :
link_deps :
	 freexl
	 geos
	 giflib
	 jpeg
	 json-c
	 libgeotiff
	 libpng
	 libpq
	 libspatialite
	 libtiff
	 libxml2
	 numpy
	 pcre
	 proj
	 python
	 python@2
	 sqlite
	 zstd
	 mysql
	 cfitsio
	 epsilon
	 hdf5
	 jasper
	 json-c
	 libdap
	 libxml2
	 netcdf
	 podofo
	 poppler
	 unixodbc
	 webp
	 xerces-c
	 xz
conflicts :
patches :
EOF_patch :
install :
	 args = [
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--disable-debug",
	 "--with-libtool",
	 "--with-local=#{prefix}",
	 "--with-opencl",
	 "--with-threads",
	 "--with-bsb",
	 "--with-grib",
	 "--with-pam",
	 "--with-pcidsk=internal",
	 "--with-pcraster=internal",
	 "--with-curl=/usr/bin/curl-config",
	 "--with-freexl=#{Formula["freexl"].opt_prefix}",
	 "--with-geos=#{Formula["geos"].opt_prefix}/bin/geos-config",
	 "--with-geotiff=#{Formula["libgeotiff"].opt_prefix}",
	 "--with-gif=#{Formula["giflib"].opt_prefix}",
	 "--with-jpeg=#{Formula["jpeg"].opt_prefix}",
	 "--with-libjson-c=#{Formula["json-c"].opt_prefix}",
	 "--with-libtiff=#{Formula["libtiff"].opt_prefix}",
	 "--with-pg=#{Formula["libpq"].opt_prefix}/bin/pg_config",
	 "--with-png=#{Formula["libpng"].opt_prefix}",
	 "--with-spatialite=#{Formula["libspatialite"].opt_prefix}",
	 "--with-sqlite3=#{Formula["sqlite"].opt_prefix}",
	 "--with-static-proj4=#{Formula["proj"].opt_prefix}",
	 "--with-zstd=#{Formula["zstd"].opt_prefix}",
	 "--without-grass",
	 "--without-jpeg12",
	 "--without-libgrass",
	 "--without-perl",
	 "--without-php",
	 "--without-python",
	 "--without-ruby",
	 "--with-armadillo=no",
	 "--with-qhull=no",
	 ]
	 if build.with?("mysql")
	 args << "--with-mysql=#{Formula["mysql"].opt_prefix}/bin/mysql_config"
	 else
	 args << "--without-mysql"
	 end
	 supported_backends = %w[liblzma cfitsio hdf5 netcdf jasper xerces odbc
	 dods-root epsilon webp podofo]
	 if build.with? "complete"
	 supported_backends.delete "liblzma"
	 args << "--with-liblzma=yes"
	 args.concat supported_backends.map { |b| "--with-" + b + "=" + HOMEBREW_PREFIX }
	 elsif build.without? "unsupported"
	 args.concat supported_backends.map { |b| "--without-" + b }
	 end
	 unsupported_backends = %w[gta ogdi fme hdf4 openjpeg fgdb ecw kakadu mrsid
	 jp2mrsid mrsid_lidar msg oci ingres dwgdirect
	 idb sde podofo rasdaman sosi]
	 if build.without? "unsupported"
	 args.concat unsupported_backends.map { |b| "--without-" + b }
	 end
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 if build.stable?
	 cd "swig/python" do
	 system "python3", *Language::Python.setup_install_args(prefix)
	 system "python2", *Language::Python.setup_install_args(prefix)
	 end
	 bin.install Dir["swig/python/scripts/*.py"]
	 end
	 system "make", "man" if build.head?
	 system "make", "install-man", "INST_MAN=#{man}"
	 Dir.glob("#{bin}/*.dox") { |p| rm p }

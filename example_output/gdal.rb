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

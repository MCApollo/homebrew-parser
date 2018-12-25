name :
	 Proj
homepage :
	 https://proj4.org/
url :
	 https://download.osgeo.org/proj/proj-5.2.0.tar.gz
description :
	 Cartographic Projections Library
build_deps :
link_deps :
optional_deps :
conflicts :
	 blast
resource :
	 ['datumgrid', 'usa_geoid2012b', 'usa_geoid2012', 'usa_geoid2009', 'usa_geoid2003', 'usa_geoid1999', 'vertconc', 'vertcone', 'vertconw', 'egm08_25']
	 ['https://download.osgeo.org/proj/proj-datumgrid-1.8.zip', 'https://download.osgeo.org/proj/vdatum/usa_geoid2012b.zip', 'https://download.osgeo.org/proj/vdatum/usa_geoid2012.zip', 'https://download.osgeo.org/proj/vdatum/usa_geoid2009.zip', 'https://download.osgeo.org/proj/vdatum/usa_geoid2003.zip', 'https://download.osgeo.org/proj/vdatum/usa_geoid1999.zip', 'https://download.osgeo.org/proj/vdatum/vertcon/vertconc.gtx', 'https://download.osgeo.org/proj/vdatum/vertcon/vertcone.gtx', 'https://download.osgeo.org/proj/vdatum/vertcon/vertconw.gtx', 'https://download.osgeo.org/proj/vdatum/egm08_25/egm08_25.gtx']
patches :
EOF_patch :
install :
	 resources.each do |r|
	 if r.name == "datumgrid"
	 (buildpath/"nad").install r
	 elsif build.with? "vdatum"
	 pkgshare.install r
	 end
	 end
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"

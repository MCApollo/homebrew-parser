name :
	 Geos
homepage :
	 https://trac.osgeo.org/geos
url :
	 https://download.osgeo.org/geos/geos-3.7.1.tar.bz2
description :
	 Geometry Engine
build_deps :
	 swig
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "configure" do |s|
	 s.gsub! /PYTHON_CPPFLAGS=.*/, %Q(PYTHON_CPPFLAGS="#{`python-config --includes`.strip}")
	 s.gsub! /PYTHON_LDFLAGS=.*/, 'PYTHON_LDFLAGS="-Wl,-undefined,dynamic_lookup"'
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-python"
	 system "make", "install"

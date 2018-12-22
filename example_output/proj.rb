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
conflicts :
	 blast
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

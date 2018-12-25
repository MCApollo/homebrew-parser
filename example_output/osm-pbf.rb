name :
	 OsmPbf
homepage :
	 https://wiki.openstreetmap.org/wiki/PBF_Format
url :
	 https://github.com/scrosby/OSM-binary/archive/v1.3.3.tar.gz
description :
	 Tools related to PBF (an alternative to XML format)
build_deps :
link_deps :
	 protobuf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 cd "src" do
	 system "make"
	 lib.install "libosmpbf.a"
	 end
	 include.install Dir["include/*"]

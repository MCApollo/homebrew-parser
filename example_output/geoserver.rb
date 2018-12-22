name :
	 Geoserver
homepage :
	 http://geoserver.org/
url :
	 https://downloads.sourceforge.net/project/geoserver/GeoServer/2.13.2/geoserver-2.13.2-bin.zip
description :
	 Java server to share and edit geospatial data
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 (bin/"geoserver").write <<~EOS
	 #!/bin/sh
	 if [ -z "$1" ]; then
	 echo "Usage: $ geoserver path/to/data/dir"
	 else
	 cd "#{libexec}" && java -DGEOSERVER_DATA_DIR=$1 -jar start.jar
	 fi
	 EOS

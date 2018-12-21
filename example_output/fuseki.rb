name :
	 Fuseki
homepage :
	 https://jena.apache.org/documentation/fuseki2/
url :
	 https://www.apache.org/dyn/closer.lua?path=/jena/binaries/apache-jena-fuseki-3.9.0.tar.gz
description :
	 SPARQL server
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 (var/"fuseki").mkpath
	 (var/"log/fuseki").mkpath

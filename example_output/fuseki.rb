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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 prefix.install "bin"
	 %w[fuseki-server fuseki].each do |exe|
	 libexec.install exe
	 (bin/exe).write_env_script(libexec/exe,
	 :FUSEKI_BASE => var/"fuseki",
	 :FUSEKI_HOME => libexec,
	 :FUSEKI_LOGS => var/"log/fuseki",
	 :FUSEKI_RUN  => var/"run")
	 end
	 libexec.install "fuseki-server.jar",
	 "fuseki.war",
	 "webapp"
	 (var/"fuseki").mkpath
	 (var/"log/fuseki").mkpath

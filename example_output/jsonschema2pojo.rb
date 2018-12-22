name :
	 Jsonschema2pojo
homepage :
	 http://www.jsonschema2pojo.org/
url :
	 https://github.com/joelittlejohn/jsonschema2pojo/releases/download/jsonschema2pojo-0.5.1/jsonschema2pojo-0.5.1.tar.gz
description :
	 Generates Java types from JSON Schema (or example JSON)
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "jsonschema2pojo-#{version}-javadoc.jar", "lib"
	 bin.write_jar_script libexec/"lib/jsonschema2pojo-cli-#{version}.jar", "jsonschema2pojo"

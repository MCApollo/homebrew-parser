name :
	 Blazegraph
homepage :
	 https://www.blazegraph.com/
url :
	 https://downloads.sourceforge.net/project/bigdata/bigdata/2.1.4/blazegraph.jar
description :
	 Graph database supporting RDF data model, Sesame, and Blueprint APIs
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install "blazegraph.jar"
	 bin.write_jar_script libexec/"blazegraph.jar", "blazegraph"

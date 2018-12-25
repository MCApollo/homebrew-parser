name :
	 OrcTools
homepage :
	 https://orc.apache.org/
url :
	 https://search.maven.org/remotecontent?filepath=org/apache/orc/orc-tools/1.5.3/orc-tools-1.5.3-uber.jar
description :
	 ORC java command-line tools and utilities
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
	 libexec.install "orc-tools-#{version}-uber.jar"
	 bin.write_jar_script libexec/"orc-tools-#{version}-uber.jar", "orc-tools"

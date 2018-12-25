name :
	 AvroTools
homepage :
	 https://avro.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=avro/avro-1.8.2/java/avro-tools-1.8.2.jar
description :
	 Avro command-line tools and utilities
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
	 libexec.install "avro-tools-#{version}.jar"
	 bin.write_jar_script libexec/"avro-tools-#{version}.jar", "avro-tools"

name :
	 Nailgun
homepage :
	 http://www.martiansoftware.com/nailgun/
url :
	 https://github.com/facebook/nailgun/archive/nailgun-all-v1.0.0.tar.gz
description :
	 Command-line client, protocol and server for Java programs
build_deps :
	 maven
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install", "CC=#{ENV.cc}", "PREFIX=#{prefix}", "CFLAGS=#{ENV.cflags}"
	 require "rexml/document"
	 pom_xml = REXML::Document.new(File.new("pom.xml"))
	 jar_version = REXML::XPath.first(pom_xml, "string(/pom:project/pom:version)", "pom" => "http://maven.apache.org/POM/4.0.0")
	 system "mvn", "clean", "install"
	 libexec.install Dir["nailgun-server/target/*.jar"]
	 bin.write_jar_script libexec/"nailgun-server-#{jar_version}.jar", "ng-server", "-server"

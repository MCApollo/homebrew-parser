name :
	 WiremockStandalone
homepage :
	 http://wiremock.org/docs/running-standalone/
url :
	 https://search.maven.org/remotecontent?filepath=com/github/tomakehurst/wiremock-standalone/2.18.0/wiremock-standalone-2.18.0.jar
description :
	 Simulator for HTTP-based APIs
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
	 libexec.install "wiremock-standalone-#{version}.jar"
	 bin.write_jar_script libexec/"wiremock-standalone-#{version}.jar", "wiremock"

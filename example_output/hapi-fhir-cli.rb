name :
	 HapiFhirCli
homepage :
	 http://hapifhir.io/doc_cli.html
url :
	 https://github.com/jamesagnew/hapi-fhir/releases/download/v3.6.0/hapi-fhir-3.6.0-cli.zip
description :
	 Command-line interface for the HAPI FHIR library
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 inreplace "hapi-fhir-cli", /SCRIPTDIR=(.*)/, "SCRIPTDIR=#{libexec}"
	 libexec.install "hapi-fhir-cli.jar"
	 bin.install "hapi-fhir-cli"

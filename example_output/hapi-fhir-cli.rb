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
optional_deps :
conflicts :
resource :
	 ['test_resource']
	 ['https://github.com/jamesagnew/hapi-fhir/raw/v3.6.0/hapi-fhir-structures-dstu3/src/test/resources/specimen-example.json']
patches :
EOF_patch :
install :
	 inreplace "hapi-fhir-cli", /SCRIPTDIR=(.*)/, "SCRIPTDIR=#{libexec}"
	 libexec.install "hapi-fhir-cli.jar"
	 bin.install "hapi-fhir-cli"

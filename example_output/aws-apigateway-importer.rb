name :
	 AwsApigatewayImporter
homepage :
	 https://github.com/amazon-archives/aws-apigateway-importer
url :
	 https://github.com/amazon-archives/aws-apigateway-importer/archive/aws-apigateway-importer-1.0.1.tar.gz
description :
	 AWS API Gateway Importer
build_deps :
	 maven
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/amazon-archives/aws-apigateway-importer/commit/660e3ce.diff?full_index=1
EOF_patch :
install :
	 system "mvn", "assembly:assembly"
	 libexec.install "target/aws-apigateway-importer-1.0.1-jar-with-dependencies.jar"
	 bin.write_jar_script libexec/"aws-apigateway-importer-1.0.1-jar-with-dependencies.jar", "aws-api-import"

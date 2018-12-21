name :
	 SwaggerCodegen
homepage :
	 https://swagger.io/swagger-codegen/
url :
	 https://github.com/swagger-api/swagger-codegen/archive/v3.0.3.tar.gz
description :
	 Generate clients, server stubs, and docs from an OpenAPI spec
build_deps :
	 maven
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 cmd = Language::Java.java_home_cmd("1.8")
	 ENV["JAVA_HOME"] = Utils.popen_read(cmd).chomp
	 system "mvn", "clean", "package"
	 libexec.install "modules/swagger-codegen-cli/target/swagger-codegen-cli.jar"
	 bin.write_jar_script libexec/"swagger-codegen-cli.jar", "swagger-codegen"

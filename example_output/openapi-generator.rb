name :
	 OpenapiGenerator
homepage :
	 https://openapi-generator.tech/
url :
	 https://search.maven.org/remotecontent?filepath=org/openapitools/openapi-generator-cli/3.3.4/openapi-generator-cli-3.3.4.jar
description :
	 Generate clients, server & docs from an OpenAPI spec (v2, v3)
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 cmd = Language::Java.java_home_cmd("1.8")
	 ENV["JAVA_HOME"] = Utils.popen_read(cmd).chomp
	 if build.head?
	 system "mvn", "clean", "package", "-Dmaven.javadoc.skip=true"
	 libexec.install "modules/openapi-generator-cli/target/openapi-generator-cli.jar"
	 bin.write_jar_script libexec/"openapi-generator-cli.jar", "openapi-generator"
	 else
	 libexec.install "openapi-generator-cli-#{version}.jar"
	 bin.write_jar_script libexec/"openapi-generator-cli-#{version}.jar", "openapi-generator"
	 end

name :
	 GoogleJavaFormat
homepage :
	 https://github.com/google/google-java-format
url :
	 https://github.com/google/google-java-format/archive/google-java-format-1.6.tar.gz
description :
	 Reformats Java source code to comply with Google Java Style
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
	 system "mvn", "install", "-DskipTests=true", "-Dmaven.javadoc.skip=true", "-B"
	 libexec.install "core/target/google-java-format-#{version}-all-deps.jar"
	 bin.write_jar_script libexec/"google-java-format-#{version}-all-deps.jar", "google-java-format"

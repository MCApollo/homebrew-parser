name :
	 Moco
homepage :
	 https://github.com/dreamhead/moco
url :
	 https://search.maven.org/remotecontent?filepath=com/github/dreamhead/moco-runner/0.12.0/moco-runner-0.12.0-standalone.jar
description :
	 Stub server with Maven, Gradle, Scala, and shell integration
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
	 libexec.install "moco-runner-#{version}-standalone.jar"
	 bin.write_jar_script libexec/"moco-runner-#{version}-standalone.jar", "moco"

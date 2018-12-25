name :
	 Kumo
homepage :
	 https://github.com/kennycason/kumo
url :
	 https://search.maven.org/remotecontent?filepath=com/kennycason/kumo-cli/1.17/kumo-cli-1.17.jar
description :
	 Word Clouds in Java
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
	 libexec.install "kumo-cli-#{version}.jar"
	 bin.write_jar_script libexec/"kumo-cli-#{version}.jar", "kumo"

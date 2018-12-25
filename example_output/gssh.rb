name :
	 Gssh
homepage :
	 https://github.com/int128/groovy-ssh
url :
	 https://github.com/int128/groovy-ssh/archive/2.9.0.tar.gz
description :
	 SSH automation tool based on Groovy DSL
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
	 ENV["CIRCLE_TAG"] = version
	 system "./gradlew", "shadowJar"
	 libexec.install "cli/build/libs/gssh.jar"
	 bin.write_jar_script libexec/"gssh.jar", "gssh", :java_version => "1.8"

name :
	 Jflex
homepage :
	 http://jflex.de/
url :
	 http://jflex.de/release/jflex-1.7.0.zip
description :
	 Lexical analyzer generator for Java, written in Java
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
	 pkgshare.install "examples"
	 libexec.install "lib/jflex-full-#{version}.jar" => "jflex-#{version}.jar"
	 bin.write_jar_script libexec/"jflex-#{version}.jar", "jflex"

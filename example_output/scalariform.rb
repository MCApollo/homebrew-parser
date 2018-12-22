name :
	 Scalariform
homepage :
	 https://github.com/scala-ide/scalariform
url :
	 https://github.com/scala-ide/scalariform/releases/download/0.2.6/scalariform.jar
description :
	 Scala source code formatter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 system "sbt", "project cli", "assembly"
	 libexec.install Dir["cli/target/scala-*/cli-assembly-*.jar"]
	 bin.write_jar_script Dir[libexec/"cli-assembly-*.jar"][0], "scalariform"
	 else
	 libexec.install "scalariform.jar"
	 bin.write_jar_script libexec/"scalariform.jar", "scalariform"
	 end

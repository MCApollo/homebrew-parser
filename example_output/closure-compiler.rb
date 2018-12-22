name :
	 ClosureCompiler
homepage :
	 https://github.com/google/closure-compiler
url :
	 https://search.maven.org/remotecontent?filepath=com/google/javascript/closure-compiler/v20181008/closure-compiler-v20181008.jar
description :
	 JavaScript optimizing compiler
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.write_jar_script libexec.children.first, "closure-compiler"

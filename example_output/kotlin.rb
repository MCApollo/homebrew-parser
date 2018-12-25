name :
	 Kotlin
homepage :
	 https://kotlinlang.org/
url :
	 https://github.com/JetBrains/kotlin/releases/download/v1.3.11/kotlin-compiler-1.3.11.zip
description :
	 Statically typed programming language for the JVM
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
	 libexec.install "bin", "build.txt", "lib"
	 rm Dir["#{libexec}/bin/*.bat"]
	 bin.install_symlink Dir["#{libexec}/bin/*"]
	 prefix.install "license"

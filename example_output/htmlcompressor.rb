name :
	 Htmlcompressor
homepage :
	 https://code.google.com/archive/p/htmlcompressor/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/htmlcompressor/htmlcompressor-1.5.3.jar
description :
	 Minify HTML or XML
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
	 libexec.install "htmlcompressor-#{version}.jar"
	 bin.write_jar_script libexec/"htmlcompressor-#{version}.jar", "htmlcompressor"

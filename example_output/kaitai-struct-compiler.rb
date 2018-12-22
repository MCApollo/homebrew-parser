name :
	 KaitaiStructCompiler
homepage :
	 https://kaitai.io/
url :
	 https://bintray.com/artifact/download/kaitai-io/universal/0.8/kaitai-struct-compiler-0.8.zip
description :
	 Compiler for generating binary data parsers
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"bin/kaitai-struct-compiler"

name :
	 Nim
homepage :
	 https://nim-lang.org/
url :
	 https://nim-lang.org/download/nim-0.19.0.tar.xz
description :
	 Statically typed, imperative programming language
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 resource("csources").stage do
	 system "/bin/sh", "build.sh"
	 build_bin = buildpath/"bin"
	 build_bin.install "bin/nim"

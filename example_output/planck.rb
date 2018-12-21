name :
	 Planck
homepage :
	 http://planck-repl.org/
url :
	 https://github.com/planck-repl/planck/archive/2.19.0.tar.gz
description :
	 Stand-alone ClojureScript REPL
build_deps :
	 clojure
	 cmake
	 pkg-config
	 :xcode
link_deps :
	 icu4c
	 libzip
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "./script/build-sandbox"
	 bin.install "planck-c/build/planck"
	 bin.install "planck-sh/plk"
	 man1.install Dir["planck-man/*.1"]

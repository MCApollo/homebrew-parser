name :
	 Leiningen
homepage :
	 https://github.com/technomancy/leiningen
url :
	 https://github.com/technomancy/leiningen/archive/2.8.3.tar.gz
description :
	 Build tool for Clojure
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 jar = "leiningen-#{version}-standalone.jar"
	 resource("jar").stage do
	 libexec.install "leiningen-#{version}-standalone.zip" => jar

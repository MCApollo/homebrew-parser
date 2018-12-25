name :
	 Drake
homepage :
	 https://github.com/Factual/drake
url :
	 https://raw.githubusercontent.com/Factual/drake/1.0.3/bin/drake-pkg
description :
	 Data workflow tool meant to be 'make for data'
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
	 jar = "drake-#{version}-standalone.jar"
	 inreplace "drake-pkg", /DRAKE_JAR/, libexec/jar
	 bin.install "drake-pkg" => "drake"
	 resource("jar").stage do
	 libexec.install "drake.jar" => jar
	 end

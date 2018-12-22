name :
	 Micronaut
homepage :
	 http://micronaut.io
url :
	 https://github.com/micronaut-projects/micronaut-core/releases/download/v1.0.1/micronaut-1.0.1.zip
description :
	 Modern JVM-based framework for building modular microservices
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 libexec.install %W[bin media cli-#{version}.jar]
	 bin.install_symlink libexec/"bin/mn"

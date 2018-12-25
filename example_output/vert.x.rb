name :
	 VertX
homepage :
	 https://vertx.io/
url :
	 https://dl.bintray.com/vertx/downloads/vert.x-3.6.2-full.tar.gz
description :
	 Toolkit for building reactive applications on the JVM
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 libexec.install %w[bin conf lib]
	 bin.install_symlink "#{libexec}/bin/vertx"

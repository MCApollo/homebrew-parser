name :
	 Hornetq
homepage :
	 https://hornetq.jboss.org/
url :
	 https://downloads.jboss.org/hornetq/hornetq-2.4.0.Final-bin.tar.gz
description :
	 Multi-protocol, embeddable, clustered, asynchronous messaging system
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 (bin+"hornet-start").write wrapper_script("run.sh")
	 (bin+"hornet-stop").write wrapper_script("stop.sh")

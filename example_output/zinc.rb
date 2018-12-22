name :
	 Zinc
homepage :
	 https://github.com/typesafehub/zinc
url :
	 https://downloads.typesafe.com/zinc/0.3.15/zinc-0.3.15.tgz
description :
	 Stand-alone version of sbt's Scala incremental compiler
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/ng/{linux,win}*"]
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"bin/zinc"

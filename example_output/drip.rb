name :
	 Drip
homepage :
	 https://github.com/flatland/drip
url :
	 https://github.com/flatland/drip/archive/0.2.4.tar.gz
description :
	 JVM launching without the hassle of persistent JVMs
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 libexec.install %w[bin src Makefile]
	 bin.install_symlink libexec/"bin/drip"

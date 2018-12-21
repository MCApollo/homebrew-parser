name :
	 Beast
homepage :
	 http://beast.community/
url :
	 https://github.com/beast-dev/beast-mcmc/archive/v1.10.4.tar.gz
description :
	 Bayesian Evolutionary Analysis Sampling Trees
build_deps :
	 ant
link_deps :
	 beagle
	 :java
conflicts :
patches :
EOF_patch :
install :
	 system "ant", "linux"
	 libexec.install Dir["release/Linux/BEASTv*/*"]
	 pkgshare.install_symlink libexec/"examples"
	 bin.install_symlink Dir[libexec/"bin/*"]

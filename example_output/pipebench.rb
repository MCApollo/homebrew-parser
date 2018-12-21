name :
	 Pipebench
homepage :
	 http://www.habets.pp.se/synscan/programs.php?prog=pipebench
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/p/pipebench/pipebench_0.40.orig.tar.gz
description :
	 Measure the speed of STDIN/STDOUT communication
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "pipebench"
	 man1.install "pipebench.1"

name :
	 WatchSim
homepage :
	 https://github.com/alloy/watch-sim
url :
	 https://github.com/alloy/watch-sim/archive/1.0.0.tar.gz
description :
	 Command-line WatchKit application launcher
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "watch-sim"

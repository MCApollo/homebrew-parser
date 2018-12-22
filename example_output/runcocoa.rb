name :
	 Runcocoa
homepage :
	 https://github.com/michaeltyson/Commandline-Cocoa
url :
	 https://github.com/michaeltyson/Commandline-Cocoa/archive/834f73b4b5d0d2be0d336c9869973f5f0db55949.tar.gz
description :
	 Tools to run Cocoa/Objective-C and C code from the command-line
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "runcocoa.sh" => "runcocoa"
	 bin.install "runc.sh" => "runc"

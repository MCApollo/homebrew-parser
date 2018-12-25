name :
	 AngleGrinder
homepage :
	 https://github.com/rcoh/angle-grinder
url :
	 https://github.com/rcoh/angle-grinder/archive/v0.7.6.tar.gz
description :
	 Slice and dice log files on the command-line
build_deps :
	 rust
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cargo", "install", "--root", prefix, "--path", "."

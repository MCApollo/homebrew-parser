name :
	 Rbspy
homepage :
	 https://rbspy.github.io/
url :
	 https://github.com/rbspy/rbspy/archive/v0.3.3.tar.gz
description :
	 Sampling profiler for Ruby
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

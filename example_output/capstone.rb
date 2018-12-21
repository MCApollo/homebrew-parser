name :
	 Capstone
homepage :
	 https://www.capstone-engine.org/
url :
	 https://github.com/aquynh/capstone/archive/3.0.5.tar.gz
description :
	 Multi-platform, multi-architecture disassembly framework
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["HOMEBREW_CAPSTONE"] = "1"
	 ENV["PREFIX"] = prefix
	 system "./make.sh"
	 system "./make.sh", "install"

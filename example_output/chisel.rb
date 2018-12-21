name :
	 Chisel
homepage :
	 https://github.com/facebook/chisel
url :
	 https://github.com/facebook/chisel/archive/1.8.1.tar.gz
description :
	 Collection of LLDB commands to assist debugging iOS apps
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*.py", "commands"]
	 prefix.install "PATENTS"
	 system "make", "-C", "Chisel", "install", "PREFIX=#{lib}", \
	 "LD_DYLIB_INSTALL_NAME=#{opt_prefix}/lib/Chisel.framework/Chisel"

name :
	 Zookeeper
homepage :
	 https://zookeeper.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz
description :
	 Centralized server for distributed coordination of services
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if Hardware::CPU.is_32_bit?
	 ENV["ARCHFLAGS"] = "-arch #{Hardware::CPU.arch_32_bit}"
	 else
	 ENV["ARCHFLAGS"] = Hardware::CPU.universal_archs.as_arch_flags

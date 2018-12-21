name :
	 Ori
homepage :
	 http://ori.scs.stanford.edu/
url :
	 https://bitbucket.org/orifs/ori/downloads/ori-0.8.1.tgz
description :
	 Secure distributed file system
build_deps :
	 pkg-config
	 scons
link_deps :
	 boost@1.60
	 libevent
	 openssl
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 scons "BUILDTYPE=RELEASE"
	 scons "install", "PREFIX=#{prefix}"

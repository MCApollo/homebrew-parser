name :
	 P0f
homepage :
	 http://lcamtuf.coredump.cx/p0f3/
url :
	 http://lcamtuf.coredump.cx/p0f3/releases/p0f-3.09b.tgz
description :
	 Versatile passive OS fingerprinting, masquerade detection tool
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "config.h", "p0f.fp", "#{etc}/p0f/p0f.fp"
	 system "./build.sh"
	 sbin.install "p0f"
	 (etc/"p0f").install "p0f.fp"

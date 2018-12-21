name :
	 Snap7
homepage :
	 https://snap7.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/snap7/1.4.2/snap7-full-1.4.2.7z
description :
	 Ethernet communication suite that works natively with Siemens S7 PLCs
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 lib.mkpath
	 system "make", "-C", "build/osx",
	 "-f", "#{MacOS.preferred_arch}_osx.mk",
	 "install", "LibInstall=#{lib}"
	 include.install "release/Wrappers/c-cpp/snap7.h"

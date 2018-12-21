name :
	 Ace
homepage :
	 https://www.dre.vanderbilt.edu/~schmidt/ACE.html
url :
	 https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-6_5_3/ACE-6.5.3.tar.bz2
description :
	 ADAPTIVE Communication Environment: OO network programming in C++
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ln_sf "config-macosx.h", "ace/config.h"
	 ln_sf "platform_macosx.GNU", "include/makeinclude/platform_macros.GNU"
	 ENV["ACE_ROOT"] = buildpath
	 ENV["DYLD_LIBRARY_PATH"] = "#{buildpath}/lib"
	 system "make", "-C", "ace", "-f", "GNUmakefile.ACE",
	 "INSTALL_PREFIX=#{prefix}",
	 "LDFLAGS=",
	 "DESTDIR=",
	 "INST_DIR=/ace",
	 "debug=0",
	 "shared_libs=1",
	 "static_libs=0",
	 "install"
	 system "make", "-C", "examples"
	 pkgshare.install "examples"

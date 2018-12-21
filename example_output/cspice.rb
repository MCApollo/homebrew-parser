name :
	 Cspice
homepage :
	 https://naif.jpl.nasa.gov/naif/toolkit.html
url :
	 https://naif.jpl.nasa.gov/pub/naif/toolkit/C/MacIntel_OSX_AppleC_64bit/packages/cspice.tar.Z
description :
	 Observation geometry system for robotic space science missions
build_deps :
link_deps :
conflicts :
	 openhmd
	 libftdi0
	 enscript
	 fondu
patches :
EOF_patch :
install :
	 rm_f Dir["lib/*"]
	 rm_f Dir["exe/*"]
	 system "csh", "makeall.csh"
	 mv "exe", "bin"
	 pkgshare.install "doc", "data"
	 prefix.install "bin", "include", "lib"
	 lib.install_symlink "cspice.a" => "libcspice.a"
	 lib.install_symlink "csupport.a" => "libcsupport.a"

name :
	 Odpi
homepage :
	 https://oracle.github.io/odpi/
url :
	 https://github.com/oracle/odpi/archive/v3.0.0.tar.gz
description :
	 Oracle Database Programming Interface for Drivers and Applications
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 lib.install Dir["lib/*"]
	 include.install Dir["include/*"]

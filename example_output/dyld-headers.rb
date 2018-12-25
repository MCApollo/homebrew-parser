name :
	 DyldHeaders
homepage :
	 https://opensource.apple.com/
url :
	 https://opensource.apple.com/tarballs/dyld/dyld-360.18.tar.gz
description :
	 Header files for the dynamic linker
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
	 include.install Dir["include/*"]

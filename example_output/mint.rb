name :
	 Mint
homepage :
	 https://github.com/yonaskolb/Mint
url :
	 https://github.com/yonaskolb/Mint/archive/0.11.3.tar.gz
description :
	 Dependency manager that installs and runs Swift command-line tool packages
build_deps :
link_deps :
	 :xcode
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"

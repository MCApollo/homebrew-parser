name :
	 Mergepbx
homepage :
	 https://github.com/simonwagner/mergepbx
url :
	 https://github.com/simonwagner/mergepbx/archive/v0.10.tar.gz
description :
	 Merge XCode project files in git
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./build.py"
	 bin.install "mergepbx"

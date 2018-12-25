name :
	 Progress
homepage :
	 https://github.com/Xfennec/progress
url :
	 https://github.com/Xfennec/progress/archive/v0.14.tar.gz
description :
	 Progress: Coreutils Progress Viewer
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
	 system "make", "PREFIX=#{prefix}", "install"

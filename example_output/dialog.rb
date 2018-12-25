name :
	 Dialog
homepage :
	 https://invisible-island.net/dialog/
url :
	 https://invisible-mirror.net/archives/dialog/dialog-1.3-20181107.tgz
description :
	 Display user-friendly message boxes from shell scripts
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install-full"

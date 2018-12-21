name :
	 LSmash
homepage :
	 https://l-smash.github.io/l-smash/
url :
	 https://github.com/l-smash/l-smash.git
description :
	 Tool for working with MP4 files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--enable-shared"
	 system "make", "install"

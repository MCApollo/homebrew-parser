name :
	 Mg
homepage :
	 https://github.com/ibara/mg
url :
	 https://dl.bintray.com/homebrew/mirror/mg-20180421.tar.gz
description :
	 Small Emacs-like editor
build_deps :
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make"
	 system "make", "install"

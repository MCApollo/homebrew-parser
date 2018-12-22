name :
	 Wgetpaste
homepage :
	 https://wgetpaste.zlin.dk/
url :
	 https://wgetpaste.zlin.dk/wgetpaste-2.28.tar.bz2
description :
	 Automate pasting to a number of pastebin services
build_deps :
link_deps :
	 wget
conflicts :
patches :
EOF_patch :
install :
	 bin.install "wgetpaste"
	 zsh_completion.install "_wgetpaste"

name :
	 FcitxRemoteForOsx
homepage :
	 https://github.com/CodeFalling/fcitx-remote-for-osx
url :
	 https://github.com/CodeFalling/fcitx-remote-for-osx/archive/0.3.0.tar.gz
description :
	 Handle input method in command-line
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 input_method = ARGV.value("with-input-method") || "general"
	 system "./build.py", "build", input_method
	 bin.install "fcitx-remote-#{input_method}"
	 bin.install_symlink "fcitx-remote-#{input_method}" => "fcitx-remote"

name :
	 Autojump
homepage :
	 https://github.com/wting/autojump
url :
	 https://github.com/wting/autojump/archive/release-v22.5.1.tar.gz
description :
	 Shell extension to jump to frequently used directories
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
	 system "./install.py", "-d", prefix, "-z", zsh_completion
	 (prefix/"etc").install_symlink prefix/"etc/profile.d/autojump.sh"
	 libexec.install bin
	 bin.write_exec_script libexec/"bin/autojump"

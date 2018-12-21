name :
	 GitFixup
homepage :
	 https://github.com/keis/git-fixup
url :
	 https://github.com/keis/git-fixup/archive/v1.1.2.tar.gz
description :
	 Alias for git commit --fixup <ref>
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "install"
	 zsh_completion.install "completion.zsh" => "_git-fixup"

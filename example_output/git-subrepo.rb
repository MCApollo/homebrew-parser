name :
	 GitSubrepo
homepage :
	 https://github.com/ingydotnet/git-subrepo
url :
	 https://github.com/ingydotnet/git-subrepo/archive/0.4.0.tar.gz
description :
	 Git Submodule Alternative
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
	 libexec.mkpath
	 system "make", "PREFIX=#{prefix}", "INSTALL_LIB=#{libexec}", "install"
	 bin.install_symlink libexec/"git-subrepo"
	 inreplace "share/zsh-completion/_git-subrepo",
	 /^if [[ -z $GIT_SUBREPO_ROOT ]].*?^fi$/m, ""
	 mv "share/completion.bash", "share/git-subrepo"
	 bash_completion.install "share/git-subrepo"
	 zsh_completion.install "share/zsh-completion/_git-subrepo"

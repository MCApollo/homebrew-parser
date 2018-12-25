name :
	 GitFlow
homepage :
	 https://github.com/nvie/gitflow
url :
	 https://github.com/nvie/gitflow.git
description :
	 Extensions to follow Vincent Driessen's branching model
build_deps :
link_deps :
optional_deps :
conflicts :
	 git-flow-avh
resource :
	 ['completion']
	 ['https://github.com/bobthecow/git-flow-completion/archive/0.4.2.2.tar.gz']
patches :
EOF_patch :
install :
	 system "make", "prefix=#{libexec}", "install"
	 bin.write_exec_script libexec/"bin/git-flow"
	 resource("completion").stage do
	 bash_completion.install "git-flow-completion.bash"
	 zsh_completion.install "git-flow-completion.zsh"
	 end

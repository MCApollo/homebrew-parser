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
conflicts :
	 git-flow-avh
patches :
EOF_patch :
install :
	 system "make", "prefix=#{libexec}", "install"
	 bin.write_exec_script libexec/"bin/git-flow"
	 resource("completion").stage do
	 bash_completion.install "git-flow-completion.bash"
	 zsh_completion.install "git-flow-completion.zsh"

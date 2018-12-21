name :
	 GitFlowAvh
homepage :
	 https://github.com/petervanderdoes/gitflow-avh
url :
	 https://github.com/petervanderdoes/gitflow-avh/archive/1.11.0.tar.gz
description :
	 AVH edition of git-flow
build_deps :
link_deps :
	 gnu-getopt
conflicts :
	 git-flow
patches :
EOF_patch :
install :
	 system "make", "prefix=#{libexec}", "install"
	 (bin/"git-flow").write <<~EOS
	 #!/bin/bash
	 export FLAGS_GETOPT_CMD=#{Formula["gnu-getopt"].opt_bin}/getopt
	 exec "#{libexec}/bin/git-flow" "$@"
	 EOS
	 resource("completion").stage do
	 bash_completion.install "git-flow-completion.bash"
	 zsh_completion.install "git-flow-completion.zsh"
	 fish_completion.install "git.fish"

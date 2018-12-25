name :
	 GitNow
homepage :
	 https://github.com/iwata/git-now
url :
	 https://github.com/iwata/git-now.git
description :
	 Light, temporary commits for git
build_deps :
link_deps :
	 gnu-getopt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "prefix=#{libexec}", "install"
	 (bin/"git-now").write <<~EOS
	 #!/bin/sh
	 PATH=#{Formula["gnu-getopt"].opt_bin}:$PATH #{libexec}/bin/git-now "$@"
	 EOS
	 zsh_completion.install "etc/_git-now"

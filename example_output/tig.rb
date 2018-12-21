name :
	 Tig
homepage :
	 https://jonas.github.io/tig/
url :
	 https://github.com/jonas/tig/releases/download/tig-2.4.1/tig-2.4.1.tar.gz
description :
	 Text interface for Git repositories
build_deps :
link_deps :
	 readline
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}"
	 system "make"
	 system "make", "install", "sysconfdir=#{pkgshare}/examples"
	 system "make", "install-doc-man"
	 bash_completion.install "contrib/tig-completion.bash"
	 zsh_completion.install "contrib/tig-completion.zsh" => "_tig"
	 cp "#{bash_completion}/tig-completion.bash", zsh_completion

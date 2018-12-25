name :
	 BashCompletionAT2
homepage :
	 https://github.com/scop/bash-completion
url :
	 https://github.com/scop/bash-completion/releases/download/2.8/bash-completion-2.8.tar.xz
description :
	 Programmable completion for Bash 4.1+
build_deps :
link_deps :
	 bash
optional_deps :
conflicts :
	 bash-completion
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "bash_completion", "readlink -f", "readlink"
	 system "autoreconf", "-i" if build.head?
	 system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}"
	 ENV.deparallelize
	 system "make", "install"

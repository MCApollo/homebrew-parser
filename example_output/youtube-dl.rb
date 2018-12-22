name :
	 YoutubeDl
homepage :
	 https://rg3.github.io/youtube-dl/
url :
	 https://github.com/rg3/youtube-dl/releases/download/2018.12.17/youtube-dl-2018.12.17.tar.gz
description :
	 Download YouTube videos from the command-line
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}" if build.head?
	 bin.install "youtube-dl"
	 man1.install "youtube-dl.1"
	 bash_completion.install "youtube-dl.bash-completion"
	 zsh_completion.install "youtube-dl.zsh" => "_youtube-dl"
	 fish_completion.install "youtube-dl.fish"

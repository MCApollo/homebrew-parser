name :
	 ZshSyntaxHighlighting
homepage :
	 https://github.com/zsh-users/zsh-syntax-highlighting
url :
	 https://github.com/zsh-users/zsh-syntax-highlighting.git
description :
	 Fish shell like syntax highlighting for zsh
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
	 system "make", "install", "PREFIX=#{prefix}"

name :
	 BashSnippets
homepage :
	 https://github.com/alexanderepstein/Bash-Snippets
url :
	 https://github.com/alexanderepstein/Bash-Snippets/archive/v1.22.1.tar.gz
description :
	 Collection of small bash scripts for heavy terminal users
build_deps :
link_deps :
optional_deps :
conflicts :
	 cheat
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./install.sh", "--prefix=#{prefix}", "all"

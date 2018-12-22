name :
	 RakeCompletion
homepage :
	 https://github.com/JoeNyland/rake-completion
url :
	 https://github.com/JoeNyland/rake-completion/archive/v1.0.0.tar.gz
description :
	 Bash completion for Rake
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bash_completion.install "rake.sh" => "rake"

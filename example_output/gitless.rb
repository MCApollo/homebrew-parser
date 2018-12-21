name :
	 Gitless
homepage :
	 https://gitless.com/
url :
	 https://github.com/sdg-mit/gitless/archive/v0.8.6.tar.gz
description :
	 Simplified version control system on top of git
build_deps :
link_deps :
	 libgit2
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources

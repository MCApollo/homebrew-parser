name :
	 Gitfs
homepage :
	 https://www.presslabs.com/gitfs
url :
	 https://github.com/PressLabs/gitfs/archive/0.4.5.1.tar.gz
description :
	 Version controlled file system
build_deps :
link_deps :
	 libgit2
	 :osxfuse
	 python
optional_deps :
conflicts :
resource :
	 ['atomiclong', 'cffi', 'fusepy', 'pygit2', 'six']
	 ['https://files.pythonhosted.org/packages/86/8c/70aea8215c6ab990f2d91e7ec171787a41b7fbc83df32a067ba5d7f3324f/atomiclong-0.1.1.tar.gz', 'https://files.pythonhosted.org/packages/5b/b9/790f8eafcdab455bcd3bd908161f802c9ce5adbf702a83aa7712fcc345b7/cffi-1.10.0.tar.gz', 'https://files.pythonhosted.org/packages/70/aa/959d781b7ac979af1a9fbea0faffe06677c390907b56b8ce024eb9320451/fusepy-2.0.4.tar.gz', 'https://files.pythonhosted.org/packages/3b/0d/c11844421c7c3b9cb84c5503185bbb5ba780144fd64f5adde572bcdcdd8a/pygit2-0.27.0.tar.gz', 'https://files.pythonhosted.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources

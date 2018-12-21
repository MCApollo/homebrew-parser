name :
	 Khard
homepage :
	 https://github.com/scheibler/khard/
url :
	 https://files.pythonhosted.org/packages/19/91/6309d5b0477582b9b663cd65f1346cec6ed5f44e734bac722e1ca2ddc1e3/khard-0.12.2.tar.gz
description :
	 Console carddav client
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 (etc/"khard").install "misc/khard/khard.conf.example"
	 zsh_completion.install "misc/zsh/_khard"
	 pkgshare.install (buildpath/"misc").children - [buildpath/"misc/zsh"]

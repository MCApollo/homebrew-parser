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
optional_deps :
conflicts :
resource :
	 ['atomicwrites', 'configobj', 'python-dateutil', 'PyYAML', 'ruamel.yaml', 'six', 'Unidecode', 'vobject']
	 ['https://files.pythonhosted.org/packages/a1/e1/2d9bc76838e6e6667fde5814aa25d7feb93d6fa471bf6816daac2596e8b2/atomicwrites-1.1.5.tar.gz', 'https://files.pythonhosted.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/configobj-5.0.6.tar.gz', 'https://files.pythonhosted.org/packages/54/bb/f1db86504f7a49e1d9b9301531181b00a1c7325dc85a29160ee3eaa73a54/python-dateutil-2.6.1.tar.gz', 'https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz', 'https://files.pythonhosted.org/packages/22/ad/8d19322e77f00f261f2dfe28e22b717f1550b3defe454d3e6b7a9874c48c/ruamel.yaml-0.15.41.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/9d/36/49d0ee152b6a1631f03a541532c6201942430060aa97fe011cf01a2cce64/Unidecode-1.0.22.tar.gz', 'https://files.pythonhosted.org/packages/8d/8b/2c6107d0132fd2309ee870eaee8501808e4e9d950e729a3dfcbd9dfd5b81/vobject-0.9.5.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 (etc/"khard").install "misc/khard/khard.conf.example"
	 zsh_completion.install "misc/zsh/_khard"
	 pkgshare.install (buildpath/"misc").children - [buildpath/"misc/zsh"]

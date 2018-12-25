name :
	 Euca2ools
homepage :
	 https://github.com/eucalyptus/euca2ools
url :
	 https://downloads.eucalyptus.com/software/euca2ools/3.4/source/euca2ools-3.4.1.tar.xz
description :
	 Eucalyptus client API tools-works with Amazon EC2 and IAM
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 ['requestbuilder', 'requests', 'six', 'lxml', 'PyYAML']
	 ['https://files.pythonhosted.org/packages/ac/b5/8b1c6c102760785ce22a08f32fb6fc8c745445ed8f1f9195d2517c79511c/requestbuilder-0.7.1.tar.gz', 'https://files.pythonhosted.org/packages/b6/61/7b374462d5b6b1d824977182db287758d549d8680444bad8d530195acba2/requests-2.12.5.tar.gz', 'https://files.pythonhosted.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz', 'https://files.pythonhosted.org/packages/66/45/f11fc376f784c6f2e77ffc7a9d02374ff3ceb07ede8c56f918939409577c/lxml-3.7.2.tar.gz', 'https://files.pythonhosted.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources

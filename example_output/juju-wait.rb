name :
	 JujuWait
homepage :
	 https://launchpad.net/juju-wait
url :
	 https://files.pythonhosted.org/packages/3d/c2/8cce9ec8386be418a76566fcd2e7dcbaa7138a92b0b9b463306d9191cfd7/juju-wait-2.6.2.tar.gz
description :
	 Juju plugin for waiting for deployments to settle
build_deps :
link_deps :
	 juju
	 libyaml
	 python
optional_deps :
conflicts :
resource :
	 ['PyYAML']
	 ['https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources

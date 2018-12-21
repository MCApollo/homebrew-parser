name :
	 VstsCli
homepage :
	 https://docs.microsoft.com/en-us/cli/vsts
url :
	 https://files.pythonhosted.org/packages/f9/c2/3ed698480ab30d2807fc961eef152099589aeaec3f1407945a4e07275de5/vsts-cli-0.1.4.tar.gz
description :
	 Manage and work with VSTS/TFS resources from the command-line
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 bin.install_symlink "#{libexec}/bin/vsts" => "vsts"

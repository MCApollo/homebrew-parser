name :
	 ReconNg
homepage :
	 https://bitbucket.org/LaNMaSteR53/recon-ng
url :
	 https://bitbucket.org/LaNMaSteR53/recon-ng/get/v4.9.4.tar.gz
description :
	 Web Reconnaissance Framework
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 libexec.install Dir["*"]
	 venv = virtualenv_create(libexec)
	 venv.pip_install resources
	 inreplace libexec/"recon-ng", "#!/usr/bin/env python", "#!#{libexec}/bin/python"
	 bin.install_symlink libexec/"recon-ng"

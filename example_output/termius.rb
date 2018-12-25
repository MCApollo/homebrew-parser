name :
	 Termius
homepage :
	 https://termius.com
url :
	 https://github.com/Crystalnix/termius-cli/archive/v1.2.12.tar.gz
description :
	 CLI tool for termius.com (aka serverauditor.com)
build_deps :
link_deps :
	 bash-completion
	 openssl
	 python
	 zsh-completions
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
	 "--ignore-installed", buildpath
	 system libexec/"bin/pip", "uninstall", "-y", "termius"
	 venv.pip_install_and_link buildpath
	 bash_completion.install "contrib/completion/bash/termius"
	 zsh_completion.install "contrib/completion/zsh/_termius"

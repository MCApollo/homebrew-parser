name :
	 B2Tools
homepage :
	 https://github.com/Backblaze/B2_Command_Line_Tool
url :
	 https://github.com/Backblaze/B2_Command_Line_Tool/archive/v1.3.8.tar.gz
description :
	 B2 Cloud Storage Command-Line Tools
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
	 boost-build
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
	 "--ignore-installed", buildpath
	 system libexec/"bin/pip", "uninstall", "-y", "b2"
	 venv.pip_install_and_link buildpath
	 bash_completion.install "contrib/bash_completion/b2" => "b2-tools-completion.bash"
	 pkgshare.install (buildpath/"contrib").children

name :
	 DockerCompose
homepage :
	 https://docs.docker.com/compose/
url :
	 https://github.com/docker/compose/archive/1.23.2.tar.gz
description :
	 Isolated development environments using Docker
build_deps :
link_deps :
	 libyaml
	 python
conflicts :
patches :
EOF_patch :
install :
	 system "./script/build/write-git-sha" if build.head?
	 venv = virtualenv_create(libexec, "python3")
	 system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
	 "--ignore-installed", buildpath
	 system libexec/"bin/pip", "uninstall", "-y", "docker-compose"
	 venv.pip_install_and_link buildpath
	 bash_completion.install "contrib/completion/bash/docker-compose"
	 zsh_completion.install "contrib/completion/zsh/_docker-compose"

name :
	 DockerCompletion
homepage :
	 https://www.docker.com/
url :
	 https://github.com/docker/docker-ce.git
description :
	 Bash, Zsh and Fish completion for Docker
build_deps :
link_deps :
optional_deps :
conflicts :
	 docker
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bash_completion.install "components/cli/contrib/completion/bash/docker"
	 fish_completion.install "components/cli/contrib/completion/fish/docker.fish"
	 zsh_completion.install "components/cli/contrib/completion/zsh/_docker"

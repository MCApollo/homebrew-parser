name :
	 Task
homepage :
	 https://taskwarrior.org/
url :
	 https://taskwarrior.org/download/task-2.5.1.tar.gz
description :
	 Feature-rich console based todo list manager
build_deps :
	 cmake
link_deps :
	 gnutls
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 bash_completion.install "scripts/bash/task.sh"
	 zsh_completion.install "scripts/zsh/_task"
	 fish_completion.install "scripts/fish/task.fish"

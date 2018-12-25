name :
	 Taskell
homepage :
	 https://taskell.app
url :
	 https://github.com/smallhadroncollider/taskell/archive/1.3.5.tar.gz
description :
	 Command-line Kanban board/task manager with support for Trello
build_deps :
	 cabal-install
	 ghc
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cabal_sandbox do
	 cabal_install "hpack"
	 system "./.cabal-sandbox/bin/hpack"
	 install_cabal_package
	 end

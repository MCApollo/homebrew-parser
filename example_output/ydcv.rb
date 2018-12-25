name :
	 Ydcv
homepage :
	 https://github.com/felixonmars/ydcv
url :
	 https://github.com/felixonmars/ydcv/archive/0.5.tar.gz
description :
	 YouDao Console Version
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install "src/ydcv.py" => "ydcv"
	 zsh_completion.install "contrib/zsh_completion" => "_ydcv"

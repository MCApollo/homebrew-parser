name :
	 Dasht
homepage :
	 https://sunaku.github.io/dasht
url :
	 https://github.com/sunaku/dasht/archive/v2.3.0.tar.gz
description :
	 Search API docs offline, in your terminal or browser
build_deps :
link_deps :
	 socat
	 sqlite
	 w3m
	 wget
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install Dir["bin/*"]
	 man.install "man/man1"

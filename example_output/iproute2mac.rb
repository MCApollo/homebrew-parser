name :
	 Iproute2mac
homepage :
	 https://github.com/brona/iproute2mac
url :
	 https://github.com/brona/iproute2mac/releases/download/v1.2.2/iproute2mac-1.2.2.tar.gz
description :
	 CLI wrapper for basic network utilities on macOS - ip command
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
	 bin.install "src/ip.py" => "ip"

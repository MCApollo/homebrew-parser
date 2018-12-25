name :
	 Ievms
homepage :
	 https://xdissent.github.io/ievms/
url :
	 https://github.com/xdissent/ievms/archive/v0.3.3.tar.gz
description :
	 Automated installation of Microsoft IE AppCompat virtual machines
build_deps :
link_deps :
	 unar
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install "ievms.sh" => "ievms"

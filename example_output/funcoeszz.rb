name :
	 Funcoeszz
homepage :
	 https://funcoeszz.net/
url :
	 https://funcoeszz.net/download/funcoeszz-15.5.sh
description :
	 Dozens of command-line mini-applications (Portuguese)
build_deps :
link_deps :
	 bash
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install "funcoeszz-#{version}.sh" => "funcoeszz"

name :
	 Modman
homepage :
	 https://github.com/colinmollenhour/modman
url :
	 https://github.com/colinmollenhour/modman/archive/1.12.tar.gz
description :
	 Module deployment script geared towards Magento development
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
	 bin.install "modman"
	 bash_completion.install "bash_completion" => "modman.bash"

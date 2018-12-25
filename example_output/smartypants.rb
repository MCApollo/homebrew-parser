name :
	 Smartypants
homepage :
	 https://daringfireball.net/projects/smartypants/
url :
	 https://daringfireball.net/projects/downloads/SmartyPants_1.5.1.zip
description :
	 Typography prettifier
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
	 bin.install "SmartyPants.pl" => "smartypants"

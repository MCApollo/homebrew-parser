name :
	 Scour
homepage :
	 https://www.codedread.com/scour/
url :
	 https://github.com/scour-project/scour/archive/v0.37.tar.gz
description :
	 SVG file scrubber
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['six']
	 ['https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources

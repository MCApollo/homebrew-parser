name :
	 Thefuck
homepage :
	 https://github.com/nvbn/thefuck
url :
	 https://files.pythonhosted.org/packages/79/5e/a8a5ae5bfbe14f6ec01b1b9cee68383b1ff71e59be41a8923e3290c6fc21/thefuck-3.28.tar.gz
description :
	 Programatically correct mistyped console commands
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['colorama', 'decorator', 'psutil', 'pyte', 'six', 'wcwidth']
	 ['https://files.pythonhosted.org/packages/e6/76/257b53926889e2835355d74fec73d82662100135293e17d382e2b74d1669/colorama-0.3.9.tar.gz', 'https://files.pythonhosted.org/packages/6f/24/15a229626c775aae5806312f6bf1e2a73785be3402c0acdec5dbddd8c11e/decorator-4.3.0.tar.gz', 'https://files.pythonhosted.org/packages/14/a2/8ac7dda36eac03950ec2668ab1b466314403031c83a95c5efc81d2acf163/psutil-5.4.5.tar.gz', 'https://files.pythonhosted.org/packages/66/37/6fed89b484c8012a0343117f085c92df8447a18af4966d25599861cd5aa0/pyte-0.8.0.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources

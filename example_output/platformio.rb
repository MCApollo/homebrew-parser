name :
	 Platformio
homepage :
	 https://platformio.org/
url :
	 https://files.pythonhosted.org/packages/8c/d0/99da2ec4a2f0f2ca3a6122a29c20a8157fcfffabce2e4227744f9cb3e5d6/platformio-3.6.3.tar.gz
description :
	 Ecosystem for IoT development (Arduino and ARM mbed compatible)
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 ['bottle', 'certifi', 'chardet', 'click', 'colorama', 'idna', 'pyserial', 'requests', 'semantic_version', 'urllib3']
	 ['https://files.pythonhosted.org/packages/38/6d/593c8338851a249c9981322bab2bcffade1101127dce27d4c682ed234558/bottle-0.12.15.tar.gz', 'https://files.pythonhosted.org/packages/55/54/3ce77783acba5979ce16674fc98b1920d00b01d337cfaaf5db22543505ed/certifi-2018.11.29.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/b7/34/a496632c4fb6c1ee76efedf77bb8d28b29363d839953d95095b12defe791/click-5.1.tar.gz', 'https://files.pythonhosted.org/packages/76/53/e785891dce0e2f2b9f4b4ff5bc6062a53332ed28833c7afede841f46a5db/colorama-0.4.1.tar.gz', 'https://files.pythonhosted.org/packages/ad/13/eb56951b6f7950cadb579ca166e448ba77f9d24efc03edd7e55fa57d04b7/idna-2.8.tar.gz', 'https://files.pythonhosted.org/packages/cc/74/11b04703ec416717b247d789103277269d567db575d2fd88f25d9767fe3d/pyserial-3.4.tar.gz', 'https://files.pythonhosted.org/packages/52/2c/514e4ac25da2b08ca5a464c50463682126385c4272c18193876e91f4bc38/requests-2.21.0.tar.gz', 'https://files.pythonhosted.org/packages/72/83/f76958017f3094b072d8e3a72d25c3ed65f754cc607fdb6a7b33d84ab1d5/semantic_version-2.6.0.tar.gz', 'https://files.pythonhosted.org/packages/b1/53/37d82ab391393565f2f831b8eedbffd57db5a718216f82f1a8b4d381a1c1/urllib3-1.24.1.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources

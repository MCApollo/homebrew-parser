name :
	 BandcampDl
homepage :
	 https://github.com/iheanyi/bandcamp-dl
url :
	 https://github.com/iheanyi/bandcamp-dl/archive/v0.0.8-12.tar.gz
description :
	 Simple python script to download Bandcamp albums
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['Unidecode', 'beautifulsoup4', 'certifi', 'chardet', 'demjson', 'docopt', 'idna', 'mock', 'mutagen', 'pbr', 'requests', 'six', 'unicode-slugify', 'urllib3']
	 ['https://files.pythonhosted.org/packages/9d/36/49d0ee152b6a1631f03a541532c6201942430060aa97fe011cf01a2cce64/Unidecode-1.0.22.tar.gz', 'https://files.pythonhosted.org/packages/fa/8d/1d14391fdaed5abada4e0f63543fef49b8331a34ca60c88bd521bcf7f782/beautifulsoup4-4.6.0.tar.gz', 'https://files.pythonhosted.org/packages/15/d4/2f888fc463d516ff7bf2379a4e9a552fef7f22a94147655d9b1097108248/certifi-2018.1.18.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/96/67/6db789e2533158963d4af689f961b644ddd9200615b8ce92d6cad695c65a/demjson-2.2.4.tar.gz', 'https://files.pythonhosted.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz', 'https://files.pythonhosted.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz', 'https://files.pythonhosted.org/packages/0c/53/014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf2539f/mock-2.0.0.tar.gz', 'https://files.pythonhosted.org/packages/2c/6a/0b2caf9364db074b616b1b8c26ce7166a883c21b0e40bd50f6db02307afe/mutagen-1.40.0.tar.gz', 'https://files.pythonhosted.org/packages/d5/d6/f2bf137d71e4f213b575faa9eb426a8775732432edb67588a8ee836ecb80/pbr-3.1.1.tar.gz', 'https://files.pythonhosted.org/packages/b0/e1/eab4fc3752e3d240468a8c0b284607899d2fbfb236a56b7377a329aa8d09/requests-2.18.4.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/8c/ba/1a05f61c7fd72df85ae4dc1c7967a3e5a4b6c61f016e794bc7f09b2597c0/unicode-slugify-0.1.3.tar.gz', 'https://files.pythonhosted.org/packages/ee/11/7c59620aceedcc1ef65e156cc5ce5a24ef87be4107c2b74458464e437a5d/urllib3-1.22.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources

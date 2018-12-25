name :
	 Csvkit
homepage :
	 https://csvkit.readthedocs.io/
url :
	 https://files.pythonhosted.org/packages/01/69/476d4e74d84bcc5196f6b6a87b419363e163bc8c31d0660166f9e447bd97/csvkit-1.0.3.tar.gz
description :
	 Suite of command-line tools for converting to and working with CSV
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['agate', 'agate-dbf', 'agate-excel', 'agate-sql', 'Babel', 'dbfread', 'et_xmlfile', 'future', 'isodate', 'jdcal', 'leather', 'openpyxl', 'parsedatetime', 'python-slugify', 'pytimeparse', 'pytz', 'six', 'SQLAlchemy', 'Unidecode', 'xlrd']
	 ['https://files.pythonhosted.org/packages/d4/1c/99fb34c81c68012c71e8d35a1f16a6b25952322e23c911c81327c8464be8/agate-1.6.1.tar.gz', 'https://files.pythonhosted.org/packages/61/81/17a635599352eab163958905a70261f9eb1d7c4b54036d1c2115adf88162/agate-dbf-0.2.0.tar.gz', 'https://files.pythonhosted.org/packages/02/c0/b82c6f830946203ec16d83eb8a6b250309ba8dcec14640b94eb69d88d30c/agate-excel-0.2.2.tar.gz', 'https://files.pythonhosted.org/packages/c7/0c/8ff3f82bf7ca84b2f12362553029830a582a2065499259e9498f08964c99/agate-sql-0.5.3.tar.gz', 'https://files.pythonhosted.org/packages/be/cc/9c981b249a455fa0c76338966325fc70b7265521bad641bf2932f77712f4/Babel-2.6.0.tar.gz', 'https://files.pythonhosted.org/packages/ad/ae/a5891681f5012724d062a4ca63ec2ff539c73d5804ba594e7e0e72099d3f/dbfread-2.0.7.tar.gz', 'https://files.pythonhosted.org/packages/22/28/a99c42aea746e18382ad9fb36f64c1c1f04216f41797f2f0fa567da11388/et_xmlfile-1.0.1.tar.gz', 'https://files.pythonhosted.org/packages/00/2b/8d082ddfed935f3608cc61140df6dcbf0edea1bc3ab52fb6c29ae3e81e85/future-0.16.0.tar.gz', 'https://files.pythonhosted.org/packages/b1/80/fb8c13a4cd38eb5021dc3741a9e588e4d1de88d895c1910c6fc8a08b7a70/isodate-0.6.0.tar.gz', 'https://files.pythonhosted.org/packages/3b/d5/181cab9a39dbe8060bd073acae2518e0378e66ff7509c4c6db0881d58e01/jdcal-1.4.tar.gz', 'https://files.pythonhosted.org/packages/a0/44/1acad8bfe958874c66825a4bdddbd277a549580b88c5daf3a4c128c521b0/leather-0.3.3.tar.gz', 'https://files.pythonhosted.org/packages/f6/13/3c1263b852377738eaa60f99602fb58cc8ad2fd1badb0b724b0d5b532727/openpyxl-2.5.4.tar.gz', 'https://files.pythonhosted.org/packages/e3/b3/02385db13f1f25f04ad7895f35e9fe3960a4b9d53112775a6f7d63f264b6/parsedatetime-2.4.tar.gz', 'https://files.pythonhosted.org/packages/70/c1/98bfb2c981787dcec4613c5da2c17d6f54613935b0e3a877e87a9fa974e4/python-slugify-1.2.5.tar.gz', 'https://files.pythonhosted.org/packages/37/5d/231f5f33c81e09682708fb323f9e4041408d8223e2f0fb9742843328778f/pytimeparse-1.1.8.tar.gz', 'https://files.pythonhosted.org/packages/ca/a9/62f96decb1e309d6300ebe7eee9acfd7bccaeedd693794437005b9067b44/pytz-2018.5.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/28/99/ad4dd8240ff8a98c8786fef6d2b392fb2309b0c2bcf23fdfbf3a4cb1a499/SQLAlchemy-1.2.9.tar.gz', 'https://files.pythonhosted.org/packages/9d/36/49d0ee152b6a1631f03a541532c6201942430060aa97fe011cf01a2cce64/Unidecode-1.0.22.tar.gz', 'https://files.pythonhosted.org/packages/86/cf/bb010f16cefa8f26ac9329ca033134bcabc7a27f5c3d8de961bacc0f80b3/xlrd-1.1.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources

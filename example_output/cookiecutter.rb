name :
	 Cookiecutter
homepage :
	 https://github.com/audreyr/cookiecutter
url :
	 https://github.com/audreyr/cookiecutter/archive/1.6.0.tar.gz
description :
	 Utility that creates projects from templates
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['arrow', 'binaryornot', 'certifi', 'chardet', 'click', 'future', 'idna', 'Jinja2', 'jinja2-time', 'MarkupSafe', 'poyo', 'python-dateutil', 'requests', 'six', 'urllib3', 'whichcraft']
	 ['https://files.pythonhosted.org/packages/54/db/76459c4dd3561bbe682619a5c576ff30c42e37c2e01900ed30a501957150/arrow-0.10.0.tar.gz', 'https://files.pythonhosted.org/packages/a7/fe/7ebfec74d49f97fc55cd38240c7a7d08134002b1e14be8c3897c0dd5e49b/binaryornot-0.4.4.tar.gz', 'https://files.pythonhosted.org/packages/20/d0/3f7a84b0c5b89e94abbd073a5f00c7176089f526edb056686751d5064cbd/certifi-2017.7.27.1.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz', 'https://files.pythonhosted.org/packages/00/2b/8d082ddfed935f3608cc61140df6dcbf0edea1bc3ab52fb6c29ae3e81e85/future-0.16.0.tar.gz', 'https://files.pythonhosted.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz', 'https://files.pythonhosted.org/packages/90/61/f820ff0076a2599dd39406dcb858ecb239438c02ce706c8e91131ab9c7f1/Jinja2-2.9.6.tar.gz', 'https://files.pythonhosted.org/packages/de/7c/ee2f2014a2a0616ad3328e58e7dac879251babdb4cb796d770b5d32c469f/jinja2-time-0.2.0.tar.gz', 'https://files.pythonhosted.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz', 'https://files.pythonhosted.org/packages/9f/7a/d92b5cc1d2f6bf0f1c1cd427e1665a3b3889563ba25fbb66f50356954c45/poyo-0.4.1.tar.gz', 'https://files.pythonhosted.org/packages/54/bb/f1db86504f7a49e1d9b9301531181b00a1c7325dc85a29160ee3eaa73a54/python-dateutil-2.6.1.tar.gz', 'https://files.pythonhosted.org/packages/b0/e1/eab4fc3752e3d240468a8c0b284607899d2fbfb236a56b7377a329aa8d09/requests-2.18.4.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/ee/11/7c59620aceedcc1ef65e156cc5ce5a24ef87be4107c2b74458464e437a5d/urllib3-1.22.tar.gz', 'https://files.pythonhosted.org/packages/e5/cd/7fb54d4b3d43ed59ecb704fb96876831e0b493c4e24eecddd4ecb2442f5e/whichcraft-0.4.1.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources

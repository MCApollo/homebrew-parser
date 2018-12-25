name :
	 Certbot
homepage :
	 https://certbot.eff.org/
url :
	 https://github.com/certbot/certbot/archive/v0.29.1.tar.gz
description :
	 Tool to obtain certs from Let's Encrypt and autoenable HTTPS
build_deps :
link_deps :
	 augeas
	 dialog
	 openssl
	 python
optional_deps :
conflicts :
resource :
	 ['asn1crypto', 'certifi', 'cffi', 'chardet', 'ConfigArgParse', 'configobj', 'cryptography', 'future', 'idna', 'josepy', 'mock', 'parsedatetime', 'pbr', 'pycparser', 'pyOpenSSL', 'pyparsing', 'pyRFC3339', 'python-augeas', 'pytz', 'requests', 'requests-toolbelt', 'six', 'urllib3', 'zope.component', 'zope.deferredimport', 'zope.deprecation', 'zope.event', 'zope.hookable', 'zope.interface', 'zope.proxy']
	 ['https://files.pythonhosted.org/packages/fc/f1/8db7daa71f414ddabfa056c4ef792e1461ff655c2ae2928a2b675bfed6b4/asn1crypto-0.24.0.tar.gz', 'https://files.pythonhosted.org/packages/55/54/3ce77783acba5979ce16674fc98b1920d00b01d337cfaaf5db22543505ed/certifi-2018.11.29.tar.gz', 'https://files.pythonhosted.org/packages/e7/a7/4cd50e57cc6f436f1cc3a7e8fa700ff9b8b4d471620629074913e3735fb2/cffi-1.11.5.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/77/61/ae928ce6ab85d4479ea198488cf5ffa371bd4ece2030c0ee85ff668deac5/ConfigArgParse-0.13.0.tar.gz', 'https://files.pythonhosted.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/configobj-5.0.6.tar.gz', 'https://files.pythonhosted.org/packages/f3/39/d3904df7c56f8654691c4ae1bdb270c1c9220d6da79bd3b1fbad91afd0e1/cryptography-2.4.2.tar.gz', 'https://files.pythonhosted.org/packages/90/52/e20466b85000a181e1e144fd8305caf2cf475e2f9674e797b222f8105f5f/future-0.17.1.tar.gz', 'https://files.pythonhosted.org/packages/ad/13/eb56951b6f7950cadb579ca166e448ba77f9d24efc03edd7e55fa57d04b7/idna-2.8.tar.gz', 'https://files.pythonhosted.org/packages/b6/19/d6bee2676ce84d7ea2ea2ee1fb16cf63024afcc1e3c9455ea3e044f77318/josepy-1.1.0.tar.gz', 'https://files.pythonhosted.org/packages/0c/53/014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf2539f/mock-2.0.0.tar.gz', 'https://files.pythonhosted.org/packages/e3/b3/02385db13f1f25f04ad7895f35e9fe3960a4b9d53112775a6f7d63f264b6/parsedatetime-2.4.tar.gz', 'https://files.pythonhosted.org/packages/33/07/6e68a96ff240a0e7bb1f6e21093532386a98a82d56512e1e3da6d125f7aa/pbr-5.1.1.tar.gz', 'https://files.pythonhosted.org/packages/68/9e/49196946aee219aead1290e00d1e7fdeab8567783e83e1b9ab5585e6206a/pycparser-2.19.tar.gz', 'https://files.pythonhosted.org/packages/9b/7c/ee600b2a9304d260d96044ab5c5e57aa489755b92bbeb4c0803f9504f480/pyOpenSSL-18.0.0.tar.gz', 'https://files.pythonhosted.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz', 'https://files.pythonhosted.org/packages/00/52/75ea0ae249ba885c9429e421b4f94bc154df68484847f1ac164287d978d7/pyRFC3339-1.1.tar.gz', 'https://files.pythonhosted.org/packages/b4/d7/62d335d9df28e2f78207dcd12bbbcee89a7b5ba6d247feaddc9d04f27e1e/python-augeas-1.0.3.tar.gz', 'https://files.pythonhosted.org/packages/cd/71/ae99fc3df1b1c5267d37ef2c51b7d79c44ba8a5e37b48e3ca93b4d74d98b/pytz-2018.7.tar.gz', 'https://files.pythonhosted.org/packages/52/2c/514e4ac25da2b08ca5a464c50463682126385c4272c18193876e91f4bc38/requests-2.21.0.tar.gz', 'https://files.pythonhosted.org/packages/86/f9/e80fa23edca6c554f1994040064760c12b51daff54b55f9e379e899cd3d4/requests-toolbelt-0.8.0.tar.gz', 'https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz', 'https://files.pythonhosted.org/packages/b1/53/37d82ab391393565f2f831b8eedbffd57db5a718216f82f1a8b4d381a1c1/urllib3-1.24.1.tar.gz', 'https://files.pythonhosted.org/packages/49/72/69a2b1eea2b37077e24fa84d287382550c649ecd0b1f25122f4d591ba468/zope.component-4.5.tar.gz', 'https://files.pythonhosted.org/packages/88/dd/b6024072643d2321aac68b4157108c64da2a7d97e61e7c98349e7c61fb3e/zope.deferredimport-4.3.tar.gz', 'https://files.pythonhosted.org/packages/34/da/46e92d32d545dd067b9436279d84c339e8b16de2ca393d7b892bc1e1e9fd/zope.deprecation-4.4.0.tar.gz', 'https://files.pythonhosted.org/packages/4c/b2/51c0369adcf5be2334280eed230192ab3b03f81f8efda9ddea6f65cc7b32/zope.event-4.4.tar.gz', 'https://files.pythonhosted.org/packages/41/b5/378175b959565de41f45c775cdfbf8897aaeaf29a258b94e40bd2661ce46/zope.hookable-4.2.0.tar.gz', 'https://files.pythonhosted.org/packages/4e/d0/c9d16bd5b38de44a20c6dc5d5ed80a49626fafcb3db9f9efdc2a19026db6/zope.interface-4.6.0.tar.gz', 'https://files.pythonhosted.org/packages/7c/f5/e9ed65cdf8c93d24d7512ef89e21b241bc9ae75d90bc8608cc142f4c26f9/zope.proxy-4.3.1.tar.gz']
patches :
EOF_patch :
install :
	 venv = virtualenv_install_with_resources
	 %w[acme certbot-apache certbot-nginx].each do |r|
	 venv.pip_install buildpath/r
	 end
	 pkgshare.install "examples"

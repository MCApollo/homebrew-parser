name :
	 Dnstwist
homepage :
	 https://github.com/elceef/dnstwist
url :
	 https://github.com/elceef/dnstwist/archive/v1.02.tar.gz
description :
	 Test domains for typo squatting, phishing and corporate espionage
build_deps :
link_deps :
	 geoip
	 python
	 ssdeep
optional_deps :
conflicts :
resource :
	 ['GeoIP', 'certifi', 'cffi', 'chardet', 'dnspython', 'idna', 'pycparser', 'requests', 'six', 'ssdeep', 'urllib3', 'whois']
	 ['https://files.pythonhosted.org/packages/f2/7b/a463b7c3df8ef4b9c92906da29ddc9e464d4045f00c475ad31cdb9a97aae/GeoIP-1.3.2.tar.gz', 'https://files.pythonhosted.org/packages/e1/0f/f8d5e939184547b3bdc6128551b831a62832713aa98c2ccdf8c47ecc7f17/certifi-2018.8.24.tar.gz', 'https://files.pythonhosted.org/packages/e7/a7/4cd50e57cc6f436f1cc3a7e8fa700ff9b8b4d471620629074913e3735fb2/cffi-1.11.5.tar.gz', 'https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz', 'https://files.pythonhosted.org/packages/e4/96/a598fa35f8a625bc39fed50cdbe3fd8a52ef215ef8475c17cabade6656cb/dnspython-1.15.0.zip', 'https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz', 'https://files.pythonhosted.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz', 'https://files.pythonhosted.org/packages/54/1f/782a5734931ddf2e1494e4cd615a51ff98e1879cbe9eecbdfeaf09aa75e9/requests-2.19.1.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/96/54/15b2e0b6e5042b67eb648e3d0e5d10105e6797353fe0a63579b74bf5eeee/ssdeep-3.3.tar.gz', 'https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15/urllib3-1.23.tar.gz', 'https://files.pythonhosted.org/packages/13/e8/656817674977bb7dd1dcee5e779daa10df65eca3dad65a018b0614bf2ac9/whois-0.7.tar.gz']
patches :
EOF_patch :
install :
	 ENV.append "CPPFLAGS", "-I#{MacOS.sdk_path}/usr/include/ffi"
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install resources
	 inreplace "dnstwist.py", "#!/usr/bin/env python", "#!#{libexec}/bin/python3"
	 (libexec/"bin").install "dnstwist.py" => "dnstwist"
	 (libexec/"bin/database").install "database/GeoIP.dat", "database/effective_tld_names.dat"
	 bin.write_exec_script libexec/"bin/dnstwist"

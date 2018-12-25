name :
	 Remarshal
homepage :
	 https://github.com/dbohdan/remarshal
url :
	 https://github.com/dbohdan/remarshal/archive/v0.9.0.tar.gz
description :
	 Convert between TOML, YAML and JSON
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['PyYAML', 'pytoml', 'python-dateutil', 'six']
	 ['https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz', 'https://files.pythonhosted.org/packages/35/35/da1123673c54b6d701453fcd20f751d6a1fae43339b3993ae458875576e4/pytoml-0.1.20.tar.gz', 'https://files.pythonhosted.org/packages/0e/01/68747933e8d12263d41ce08119620d9a7e5eb72c876a3442257f74490da0/python-dateutil-2.7.5.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 ["toml", "yaml", "json"].permutation(2).each do |informat, outformat|
	 bin.install_symlink "remarshal" => "#{informat}2#{outformat}"
	 end

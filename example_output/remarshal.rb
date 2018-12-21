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
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
	 ["toml", "yaml", "json"].permutation(2).each do |informat, outformat|
	 bin.install_symlink "remarshal" => "#{informat}2#{outformat}"

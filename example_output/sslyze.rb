name :
	 Sslyze
homepage :
	 https://github.com/nabla-c0d3/sslyze
url :
	 https://github.com/nabla-c0d3/sslyze/archive/1.4.3.tar.gz
description :
	 SSL scanner
build_deps :
link_deps :
	 :arch
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec)
	 res = resources.map(&:name).to_set
	 res -= %w[cryptography nassl openssl-legacy openssl-modern zlib]
	 res.each do |r|
	 venv.pip_install resource(r)

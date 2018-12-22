name :
	 ConjureUp
homepage :
	 https://conjure-up.io/
url :
	 https://github.com/conjure-up/conjure-up/archive/2.6.0.tar.gz
description :
	 Big software deployments so easy it's almost magical
build_deps :
link_deps :
	 awscli
	 jq
	 juju
	 juju-wait
	 libyaml
	 pwgen
	 python
	 redis
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install resource("cffi")
	 res = resources.map(&:name).to_set - ["cffi"]
	 res.each do |r|
	 venv.pip_install resource(r)
	 end
	 venv.pip_install_and_link buildpath
	 bin.install_symlink "#{libexec}/bin/kv-cli"

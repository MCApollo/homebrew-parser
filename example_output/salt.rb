name :
	 Salt
homepage :
	 https://s.saltstack.com/community/
url :
	 https://files.pythonhosted.org/packages/9b/84/48b46bad5fa13b47c10a71b4f58cf0f3a30fcb32b6a6599fca454b8c6256/salt-2018.3.2.tar.gz
description :
	 Dynamic infrastructure communication bus
build_deps :
	 swig
link_deps :
	 libgit2
	 libyaml
	 openssl
	 python@2
	 zeromq
conflicts :
patches :
EOF_patch :
install :
	 ENV["SWIG_FEATURES"]="-I#{Formula["openssl"].opt_include}"
	 virtualenv_install_with_resources
	 prefix.install libexec/"share"
	 (etc/"saltstack").install (buildpath/"conf").children

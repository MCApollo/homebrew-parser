name :
	 Dnsviz
homepage :
	 https://github.com/dnsviz/dnsviz/
url :
	 https://github.com/dnsviz/dnsviz/releases/download/v0.6.7/dnsviz-0.6.7.tar.gz
description :
	 Tools for analyzing and visualizing DNS and DNSSEC behavior
build_deps :
	 pkg-config
link_deps :
	 graphviz
	 openssl
	 python@2
optional_deps :
	 bind
conflicts :
resource :
	 ['dnspython', 'pygraphviz', 'm2crypto', 'typing']
	 ['https://files.pythonhosted.org/packages/e4/96/a598fa35f8a625bc39fed50cdbe3fd8a52ef215ef8475c17cabade6656cb/dnspython-1.15.0.zip', 'https://files.pythonhosted.org/packages/98/bb/a32e33f7665b921c926209305dde66fe41003a4ad934b10efb7c1211a419/pygraphviz-1.3.1.tar.gz', 'https://files.pythonhosted.org/packages/11/29/0b075f51c38df4649a24ecff9ead1ffc57b164710821048e3d997f1363b9/M2Crypto-0.26.0.tar.gz', 'https://files.pythonhosted.org/packages/17/75/3698d7992a828ad6d7be99c0a888b75ed173a9280e53dbae67326029b60e/typing-3.6.1.tar.gz']
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec)
	 resource("m2crypto").stage do
	 system libexec/"bin/python", "setup.py", "build_ext", "--openssl=#{Formula["openssl"].opt_prefix}", "install"
	 end
	 venv.pip_install resources.reject { |r| r.name == "m2crypto" }
	 system libexec/"bin/python", "setup.py", "build"
	 system libexec/"bin/python", "setup.py", "install", "--prefix=#{libexec}", "--install-data=#{prefix}", "--install-scripts=#{bin}"

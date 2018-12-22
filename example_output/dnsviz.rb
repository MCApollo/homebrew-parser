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
	 bind
conflicts :
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

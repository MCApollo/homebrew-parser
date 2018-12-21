name :
	 Mitmproxy
homepage :
	 https://mitmproxy.org
url :
	 https://github.com/mitmproxy/mitmproxy/archive/v4.0.4.tar.gz
description :
	 Intercept, modify, replay, save HTTP/S traffic
build_deps :
link_deps :
	 openssl
	 protobuf
	 python
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install resource("cffi")
	 venv.pip_install resources
	 venv.pip_install_and_link buildpath

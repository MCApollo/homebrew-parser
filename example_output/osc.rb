name :
	 Osc
homepage :
	 https://github.com/openSUSE/osc
url :
	 https://github.com/openSUSE/osc/archive/0.163.0.tar.gz
description :
	 The command-line interface to work with an Open Build Service
build_deps :
	 swig
link_deps :
	 openssl
	 python@2
optional_deps :
conflicts :
resource :
	 ['pycurl', 'urlgrabber', 'M2Crypto', 'typing']
	 ['https://files.pythonhosted.org/packages/12/3f/557356b60d8e59a1cce62ffc07ecc03e4f8a202c86adae34d895826281fb/pycurl-7.43.0.tar.gz', 'https://files.pythonhosted.org/packages/29/1a/f509987826e17369c52a80a07b257cc0de3d7864a303175f2634c8bcb3e3/urlgrabber-3.10.2.tar.gz', 'https://files.pythonhosted.org/packages/01/bd/a41491718f9e2bebab015c42b5be7071c6695acfa301e3fc0480bfd6a15b/M2Crypto-0.27.0.tar.gz', 'https://files.pythonhosted.org/packages/ca/38/16ba8d542e609997fdcd0214628421c971f8c395084085354b11ff4ac9c3/typing-3.6.2.tar.gz']
patches :
EOF_patch :
install :
	 ENV.delete "SDKROOT"
	 ENV["SWIG_FEATURES"]="-I#{Formula["openssl"].opt_include}"
	 venv = virtualenv_create(libexec)
	 venv.pip_install resources.reject { |r| r.name == "M2Crypto" || r.name == "pycurl" }
	 resource("M2Crypto").stage do
	 inreplace "setup.py" do |s|
	 s.gsub! "self.openssl = '/usr'",
	 "self.openssl = '#{Formula["openssl"].opt_prefix}'"
	 s.gsub! "platform.system() == \"Linux\"",
	 "platform.system() == \"Darwin\" or \\0"
	 end
	 venv.pip_install "."
	 end
	 resource("pycurl").stage do
	 system libexec/"bin/pip", "install",
	 "--install-option=--libcurl-dll=/usr/lib/libcurl.dylib", "-v",
	 "--no-binary", ":all:", "--ignore-installed", "."
	 end
	 inreplace "osc/conf.py", "'/etc/ssl/certs'", "'#{etc}/openssl/cert.pem'"
	 venv.pip_install_and_link buildpath
	 mv bin/"osc-wrapper.py", bin/"osc"

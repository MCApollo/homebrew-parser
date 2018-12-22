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
conflicts :
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

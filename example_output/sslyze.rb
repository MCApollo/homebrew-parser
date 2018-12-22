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
	 end
	 ENV.prepend_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 resource("nassl").stage do
	 nassl_path = Pathname.pwd
	 ENV.deparallelize do
	 mv "bin/openssl-legacy/include", "nassl_openssl_legacy_include"
	 mv "bin/openssl-modern/include", "nassl_openssl_modern_include"
	 rm_rf "bin"
	 (nassl_path/"bin/openssl-legacy/darwin64").mkpath
	 (nassl_path/"bin/openssl-modern/darwin64").mkpath
	 mv "nassl_openssl_legacy_include", "bin/openssl-legacy/include"
	 mv "nassl_openssl_modern_include", "bin/openssl-modern/include"
	 (nassl_path/"zlib-#{resource("zlib").version}").install resource("zlib")
	 (nassl_path/"openssl-1.0.2e").install resource("openssl-legacy")
	 (nassl_path/"openssl-master").install resource("openssl-modern")
	 system "python", "build_from_scratch.py"
	 end
	 system "python", "run_tests.py"
	 venv.pip_install nassl_path
	 ENV.prepend "CPPFLAGS", "-I#{nassl_path}/bin/openssl-modern/include"
	 ENV.prepend "LDFLAGS", "-L#{nassl_path}/bin/openssl-modern/darwin64"
	 venv.pip_install resource("cryptography")
	 end
	 venv.pip_install_and_link buildpath

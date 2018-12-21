name :
	 Dnstwist
homepage :
	 https://github.com/elceef/dnstwist
url :
	 https://github.com/elceef/dnstwist/archive/v1.02.tar.gz
description :
	 Test domains for typo squatting, phishing and corporate espionage
build_deps :
link_deps :
	 geoip
	 python
	 ssdeep
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CPPFLAGS", "-I#{MacOS.sdk_path}/usr/include/ffi"
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install resources
	 inreplace "dnstwist.py", "#!/usr/bin/env python", "#!#{libexec}/bin/python3"
	 (libexec/"bin").install "dnstwist.py" => "dnstwist"
	 (libexec/"bin/database").install "database/GeoIP.dat", "database/effective_tld_names.dat"
	 bin.write_exec_script libexec/"bin/dnstwist"

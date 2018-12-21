name :
	 Suricata
homepage :
	 https://suricata-ids.org/
url :
	 https://www.openinfosecfoundation.org/download/suricata-4.0.5.tar.gz
description :
	 Network IDS, IPS, and security monitoring engine
build_deps :
	 pkg-config
link_deps :
	 jansson
	 libmagic
	 libnet
	 libyaml
	 nspr
	 nss
	 pcre
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")

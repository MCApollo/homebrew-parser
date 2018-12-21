name :
	 AnsibleAT19
homepage :
	 https://www.ansible.com/
url :
	 https://releases.ansible.com/ansible/ansible-1.9.6.tar.gz
description :
	 Automate deployment, configuration, and upgrading
build_deps :
link_deps :
	 libyaml
	 openssl
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 vendor_site_packages = libexec/"vendor/lib/python2.7/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", vendor_site_packages
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 resources.each do |r|
	 r.stage do
	 system "python", *Language::Python.setup_install_args(libexec/"vendor")

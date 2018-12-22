name :
	 AnsibleAT20
homepage :
	 https://www.ansible.com/
url :
	 https://releases.ansible.com/ansible/ansible-2.0.2.0.tar.gz
description :
	 Automate deployment, configuration, and upgrading
build_deps :
	 pkg-config
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
	 end
	 end
	 touch vendor_site_packages/"ndg/__init__.py"
	 inreplace "lib/ansible/constants.py" do |s|
	 s.gsub! "/usr/share/ansible", pkgshare
	 s.gsub! "/etc/ansible", etc/"ansible"
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 system "python", *Language::Python.setup_install_args(libexec)
	 man1.install Dir["docs/man/man1/*.1"]
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])

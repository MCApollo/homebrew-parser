name :
	 Ansible
homepage :
	 https://www.ansible.com/
url :
	 https://releases.ansible.com/ansible/ansible-2.7.5.tar.gz
description :
	 Automate deployment, configuration, and upgrading
build_deps :
	 pkg-config
link_deps :
	 libyaml
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", Formula["python"].opt_libexec/"bin"
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 ENV.prepend "CPPFLAGS", "-I#{MacOS.sdk_path}/usr/include/ffi"
	 virtualenv_install_with_resources
	 Pathname.glob(libexec/"lib/python*/site-packages/prettytable-0.7.2-py*.egg-info").each do |prettytable_path|
	 chmod_R("a+r", prettytable_path)

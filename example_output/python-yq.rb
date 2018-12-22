name :
	 PythonYq
homepage :
	 https://yq.readthedocs.io/
url :
	 https://files.pythonhosted.org/packages/56/5f/d60ffaba376257b60304a8ee9fafdc0be4852a4bcdeece48d931e6b36487/yq-2.6.0.tar.gz
description :
	 Command-line YAML and XML processor that wraps jq
build_deps :
link_deps :
	 jq
	 python
conflicts :
	 yq
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV["PYTHONPATH"] = libexec/"lib/python#{xy}/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 env = {
	 :PATH       => "#{Formula["jq"].opt_bin}:$PATH",
	 :PYTHONPATH => ENV["PYTHONPATH"],
	 }
	 bin.env_script_all_files(libexec/"bin", env)

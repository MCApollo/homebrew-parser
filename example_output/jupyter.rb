name :
	 Jupyter
homepage :
	 https://jupyter.org/
url :
	 https://files.pythonhosted.org/packages/c9/a9/371d0b8fe37dd231cf4b2cff0a9f0f25e98f3a73c3771742444be27f2944/jupyter-1.0.0.tar.gz
description :
	 Interactive environments for writing and running code
build_deps :
link_deps :
	 ipython
	 pandoc
	 pyqt
	 python
	 zeromq
conflicts :
patches :
EOF_patch :
install :
	 ENV["JUPYTER_PATH"] = etc/"jupyter"
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 linked = %w[jupyter_core jupyter_client nbformat ipykernel jupyter_console
	 nbconvert notebook qtconsole]
	 dependencies = resources.map(&:name).to_set - linked
	 linked.delete "qtconsole" if build.without? "qtconsole"
	 dependencies.each do |r|
	 resource(r).stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 linked.each do |r|
	 resource(r).stage do
	 system "python3", *Language::Python.setup_install_args(libexec)
	 end
	 end
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", :JUPYTER_PATH => ENV["JUPYTER_PATH"], :PYTHONPATH => ENV["PYTHONPATH"])
	 rm_rf Dir["#{libexec}/share/jupyter/kernels"]

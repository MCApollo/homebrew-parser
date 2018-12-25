name :
	 Pytouhou
homepage :
	 https://pytouhou.linkmauve.fr/
url :
	 5270c34b4c00
description :
	 Libre implementation of Touhou 6 engine
build_deps :
	 pkg-config
link_deps :
	 gtk+3
	 libepoxy
	 py3cairo
	 pygobject3
	 python
	 sdl2
	 sdl2_image
	 sdl2_mixer
	 sdl2_ttf
optional_deps :
conflicts :
resource :
	 ['Cython']
	 ['https://files.pythonhosted.org/packages/b3/ae/971d3b936a7ad10e65cb7672356cff156000c5132cf406cb0f4d7a980fd3/Cython-0.28.3.tar.gz']
patches :
EOF_patch :
install :
	 pyver = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{pyver}/site-packages"
	 resource("Cython").stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 inreplace "setup.py", /(version)=.+,$/, "\\1='#{version}',"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{pyver}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 inreplace "#{libexec}/bin/pytouhou", /('path'): '\.'/, "\\1: '#{pkgshare}/game'"
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])

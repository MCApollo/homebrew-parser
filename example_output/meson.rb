name :
	 Meson
homepage :
	 https://mesonbuild.com/
url :
	 https://github.com/mesonbuild/meson/releases/download/0.49.0/meson-0.49.0.tar.gz
description :
	 Fast and user friendly build system
build_deps :
link_deps :
	 ninja
	 python
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 version = Language::Python.major_minor_version("python3")
	 ENV["PYTHONPATH"] = lib/"python#{version}/site-packages"
	 system "python3", *Language::Python.setup_install_args(prefix)
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])

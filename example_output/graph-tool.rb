name :
	 GraphTool
homepage :
	 https://graph-tool.skewed.de/
url :
	 https://downloads.skewed.de/graph-tool/graph-tool-2.27.tar.bz2
description :
	 Efficient network analysis for Python 3
build_deps :
	 pkg-config
link_deps :
	 boost
	 boost-python3
	 cairomm
	 cgal
	 google-sparsehash
	 gtk+3
	 librsvg
	 :macos
	 numpy
	 py3cairo
	 pygobject3
	 python
	 scipy
conflicts :
patches :
	 https://git.skewed.de/count0/graph-tool/commit/0407f41a.diff
	 https://git.skewed.de/count0/graph-tool/commit/aa39e4a6.diff
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :high_sierra
	 xy = Language::Python.major_minor_version "python3"
	 venv = virtualenv_create(libexec, "python3")
	 resources.each do |r|
	 venv.pip_install_and_link r

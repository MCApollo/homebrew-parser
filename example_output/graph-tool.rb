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
	 end
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 PYTHON=python3
	 PYTHON_LIBS=-undefined\ dynamic_lookup
	 --with-python-module-path=#{lib}/python#{xy}/site-packages
	 --with-boost-python=boost_python#{xy.to_s.delete(".")}-mt
	 ]
	 args << "--with-expat=#{MacOS.sdk_path}/usr" if MacOS.sdk_path_if_needed
	 system "./configure", *args
	 system "make", "install"
	 site_packages = "lib/python#{xy}/site-packages"
	 pth_contents = "import site; site.addsitedir('#{libexec/site_packages}')\n"
	 (prefix/site_packages/"homebrew-graph-tool.pth").write pth_contents

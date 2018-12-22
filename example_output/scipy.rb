name :
	 Scipy
homepage :
	 https://www.scipy.org
url :
	 https://files.pythonhosted.org/packages/07/76/7e844757b9f3bf5ab9f951ccd3e4a8eed91ab8720b0aac8c2adcc2fdae9f/scipy-1.1.0.tar.gz
description :
	 Software for mathematics, science, and engineering
build_deps :
	 swig
link_deps :
	 gcc
	 numpy
	 openblas
	 python
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 openblas = Formula["openblas"].opt_prefix
	 ENV["ATLAS"] = "None"
	 ENV["BLAS"] = ENV["LAPACK"] = "#{openblas}/lib/libopenblas.dylib"
	 config = <<~EOS
	 [DEFAULT]
	 library_dirs = #{HOMEBREW_PREFIX}/lib
	 include_dirs = #{HOMEBREW_PREFIX}/include
	 [openblas]
	 libraries = openblas
	 library_dirs = #{openblas}/lib
	 include_dirs = #{openblas}/include
	 EOS
	 Pathname("site.cfg").write config
	 Language::Python.each_python(build) do |python, version|
	 ENV["PYTHONPATH"] = Formula["numpy"].opt_lib/"python#{version}/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", lib/"python#{version}/site-packages"
	 system python, "setup.py", "build", "--fcompiler=gnu95"
	 system python, *Language::Python.setup_install_args(prefix)
	 end
	 Language::Python.each_python(build) do |_python, version|
	 rm_f Dir["#{HOMEBREW_PREFIX}/lib/python#{version}/site-packages/scipy/**/*.pyc"]
	 end

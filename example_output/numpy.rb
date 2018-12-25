name :
	 Numpy
homepage :
	 https://www.numpy.org/
url :
	 https://files.pythonhosted.org/packages/2d/80/1809de155bad674b494248bcfca0e49eb4c5d8bee58f26fe7a0dd45029e2/numpy-1.15.4.zip
description :
	 Package for scientific computing with Python
build_deps :
	 gcc
link_deps :
	 openblas
	 python
	 python@2
optional_deps :
conflicts :
resource :
	 ['nose']
	 ['https://files.pythonhosted.org/packages/58/a5/0dc93c3ec33f4e281849523a5a913fa1eea9a3068acfa754d44d88107a44/nose-1.3.7.tar.gz']
patches :
EOF_patch :
install :
	 openblas = Formula["openblas"].opt_prefix
	 ENV["ATLAS"] = "None"
	 ENV["BLAS"] = ENV["LAPACK"] = "#{openblas}/lib/libopenblas.dylib"
	 config = <<~EOS
	 [openblas]
	 libraries = openblas
	 library_dirs = #{openblas}/lib
	 include_dirs = #{openblas}/include
	 EOS
	 Pathname("site.cfg").write config
	 Language::Python.each_python(build) do |python, version|
	 dest_path = lib/"python#{version}/site-packages"
	 dest_path.mkpath
	 nose_path = libexec/"nose/lib/python#{version}/site-packages"
	 resource("nose").stage do
	 system python, *Language::Python.setup_install_args(libexec/"nose")
	 (dest_path/"homebrew-numpy-nose.pth").write "#{nose_path}\n"
	 end
	 if build.head?
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"tools/lib/python#{version}/site-packages"
	 resource("Cython").stage do
	 system python, *Language::Python.setup_install_args(buildpath/"tools")
	 end
	 end
	 system python, "setup.py",
	 "build", "--fcompiler=gnu95", "--parallel=#{ENV.make_jobs}",
	 "install", "--prefix=#{prefix}",
	 "--single-version-externally-managed", "--record=installed.txt"
	 end

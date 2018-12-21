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
conflicts :
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

name :
	 Z3
homepage :
	 https://github.com/Z3Prover/z3
url :
	 https://github.com/Z3Prover/z3/archive/z3-4.8.3.tar.gz
description :
	 High-performance theorem prover
build_deps :
link_deps :
	 python@2
	 python
conflicts :
patches :
EOF_patch :
install :
	 if build.without?("python") && build.without?("python@2")
	 odie "z3: --with-python must be specified when using --without-python@2"
	 end
	 Language::Python.each_python(build) do |python, version|
	 system python, "scripts/mk_make.py", "--prefix=#{prefix}", "--python", "--pypkgdir=#{lib}/python#{version}/site-packages", "--staticlib"
	 cd "build" do
	 system "make"
	 system "make", "install"
	 end
	 end
	 if build.head?
	 system "make", "-C", "contrib/qprofdiff"
	 bin.install "contrib/qprofdiff/qprofdiff"
	 end
	 pkgshare.install "examples"

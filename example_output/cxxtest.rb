name :
	 Cxxtest
homepage :
	 https://cxxtest.com/
url :
	 https://github.com/CxxTest/cxxtest/releases/download/4.4/cxxtest-4.4.tar.gz
description :
	 xUnit-style unit testing framework for C++
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", lib/"python#{xy}/site-packages"
	 cd "./python" do
	 system "python3", *Language::Python.setup_install_args(prefix)
	 end
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 include.install "cxxtest"
	 doc.install Dir["doc/*"]

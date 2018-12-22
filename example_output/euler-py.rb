name :
	 EulerPy
homepage :
	 https://github.com/iKevinY/EulerPy
url :
	 https://github.com/iKevinY/EulerPy/archive/v1.3.0.tar.gz
description :
	 Project Euler command-line tool written in Python
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", "#{libexec}/lib/python#{xy}/site-packages"
	 resource("click").stage do
	 system "python3", "setup.py", "install", "--prefix=#{libexec}",
	 "--single-version-externally-managed",
	 "--record=installed.txt"
	 end
	 ENV.prepend_create_path "PYTHONPATH", "#{lib}/python#{xy}/site-packages"
	 system "python3", "setup.py", "install", "--prefix=#{prefix}",
	 "--single-version-externally-managed",
	 "--record=installed.txt"
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])

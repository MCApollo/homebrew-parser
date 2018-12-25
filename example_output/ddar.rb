name :
	 Ddar
homepage :
	 https://github.com/basak/ddar
url :
	 https://github.com/basak/ddar/archive/v1.0.tar.gz
description :
	 De-duplicating archiver
build_deps :
	 xmltoman
link_deps :
	 protobuf
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "-f", "Makefile.prep", "pydist"
	 system "python", "setup.py", "install",
	 "--prefix=#{prefix}",
	 "--single-version-externally-managed",
	 "--record=installed.txt"
	 bin.env_script_all_files(libexec+"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 man1.install Dir["*.1"]

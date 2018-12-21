name :
	 Pypy
homepage :
	 https://pypy.org/
url :
	 https://bitbucket.org/pypy/pypy/downloads/pypy2-v6.0.0-src.tar.bz2
description :
	 Highly performant implementation of Python 2 in Python
build_deps :
	 pkg-config
link_deps :
	 :arch
	 gdbm
	 libffi
	 openssl
	 sqlite
conflicts :
patches :
EOF_patch :
install :
	 ENV["PYTHONPATH"] = ""
	 ENV["PYPY_USESSION_DIR"] = buildpath
	 resource("bootstrap").stage buildpath/"bootstrap"
	 python = buildpath/"bootstrap/bin/pypy"
	 cd "pypy/goal" do
	 system python, buildpath/"rpython/bin/rpython",
	 "-Ojit", "--shared", "--cc", ENV.cc, "--verbose",
	 "--make-jobs", ENV.make_jobs, "targetpypystandalone.py"
	 prefix_site_packages.mkpath
	 unless (libexec/"site-packages").symlink?
	 rm_rf libexec/"site-packages/site-packages"
	 mv Dir[libexec/"site-packages/*"], prefix_site_packages
	 rm_rf libexec/"site-packages"

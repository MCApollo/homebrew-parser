name :
	 GitCola
homepage :
	 https://git-cola.github.io/
url :
	 https://github.com/git-cola/git-cola/archive/v3.2.tar.gz
description :
	 Highly caffeinated git GUI
build_deps :
	 sphinx-doc
link_deps :
	 pyqt
	 python
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.delete("PYTHONPATH")
	 system "make", "PYTHON=python3", "prefix=#{prefix}", "install"
	 system "make", "install-doc", "PYTHON=python3", "prefix=#{prefix}",
	 "SPHINXBUILD=#{Formula["sphinx-doc"].opt_bin}/sphinx-build"

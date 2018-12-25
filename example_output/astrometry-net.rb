name :
	 AstrometryNet
homepage :
	 https://github.com/dstndstn/astrometry.net
url :
	 https://github.com/dstndstn/astrometry.net/releases/download/0.76/astrometry.net-0.76.tar.gz
description :
	 Automatic identification of astronomical images
build_deps :
	 pkg-config
	 swig
link_deps :
	 cairo
	 cfitsio
	 gsl
	 jpeg
	 libpng
	 netpbm
	 numpy
	 python
	 wcslib
optional_deps :
conflicts :
resource :
	 ['fitsio']
	 ['https://files.pythonhosted.org/packages/9c/cb/f52534b71f4d99916723af2994898904015b9a1bf0286a165182d0374bbf/fitsio-0.9.11.tar.gz']
patches :
EOF_patch :
install :
	 ENV["NETPBM_INC"] = "-I#{Formula["netpbm"].opt_include}/netpbm"
	 ENV["NETPBM_LIB"] = "-L#{Formula["netpbm"].opt_lib} -lnetpbm"
	 ENV["SYSTEM_GSL"] = "yes"
	 ENV["PYTHON_SCRIPT"] = "#{libexec}/bin/python3"
	 ENV["PYTHON"] = "python3"
	 venv = virtualenv_create(libexec, "python3")
	 venv.pip_install resources
	 ENV["INSTALL_DIR"] = prefix
	 xy = Language::Python.major_minor_version "python3"
	 ENV["PY_BASE_INSTALL_DIR"] = "#{libexec}/lib/python#{xy}/site-packages/astrometry"
	 system "make"
	 system "make", "py"
	 system "make", "install"
	 rm "#{bin}/plotann.py"
	 bin.install_symlink libexec/"lib/python#{xy}/site-packages/astrometry/blind/plotann.py"

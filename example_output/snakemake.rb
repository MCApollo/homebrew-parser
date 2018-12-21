name :
	 Snakemake
homepage :
	 https://snakemake.readthedocs.io/
url :
	 https://files.pythonhosted.org/packages/5a/a5/704ff1f58a121acf8b96f13a9b0abdbbb27a1a78cf52c676bd0bbd2c5f40/snakemake-5.2.2.tar.gz
description :
	 Pythonic workflow system
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"cython/lib/python#{xy}/site-packages"
	 resource("Cython").stage do
	 system "python3", *Language::Python.setup_install_args(buildpath/"cython")

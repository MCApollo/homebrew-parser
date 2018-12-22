name :
	 Genometools
homepage :
	 http://genometools.org/
url :
	 http://genometools.org/pub/genometools-1.5.10.tar.gz
description :
	 GenomeTools: The versatile open source genome analysis software
build_deps :
	 pkg-config
link_deps :
	 cairo
	 pango
	 python
conflicts :
	 libslax
patches :
EOF_patch :
install :
	 system "make", "prefix=#{prefix}"
	 system "make", "install", "prefix=#{prefix}"
	 cd "gtpython" do
	 inreplace "gt/dlload.py",
	 "gtlib = CDLL(\"libgenometools\" + soext)",
	 "gtlib = CDLL(\"#{lib}/libgenometools\" + soext)"
	 system "python3", *Language::Python.setup_install_args(prefix)
	 system "python3", "-m", "unittest", "discover", "tests"
	 end

name :
	 Unoconv
homepage :
	 http://dag.wiee.rs/home-made/unoconv/
url :
	 https://files.pythonhosted.org/packages/a2/b8/3131d20bfa2065e489edc7ca2dbfd66fd8d4fcbbde3476c76605a7e69269/unoconv-0.8.2.tar.gz
description :
	 Convert between any document format supported by OpenOffice
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "prefix=#{prefix}"

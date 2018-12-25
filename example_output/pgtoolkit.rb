name :
	 Pgtoolkit
homepage :
	 https://github.com/grayhemp/pgtoolkit
url :
	 https://github.com/grayhemp/pgtoolkit/archive/v1.0.2.tar.gz
description :
	 Tools for PostgreSQL maintenance
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install "fatpack/pgcompact"
	 doc.install %w[CHANGES.md LICENSE.md README.md TODO.md]

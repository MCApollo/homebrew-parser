name :
	 Dtrx
homepage :
	 https://brettcsmith.org/2007/dtrx/
url :
	 https://brettcsmith.org/2007/dtrx/dtrx-7.1.tar.gz
description :
	 Intelligent archive extraction
build_deps :
link_deps :
	 p7zip
	 unrar
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "python", "setup.py", "install", "--prefix=#{prefix}"

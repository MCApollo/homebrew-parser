name :
	 EotUtils
homepage :
	 https://www.w3.org/Tools/eot-utils/
url :
	 https://www.w3.org/Tools/eot-utils/eot-utilities-1.1.tar.gz
description :
	 Tools to convert fonts from OTF/TTF to EOT format
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"

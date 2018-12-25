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
optional_deps :
conflicts :
resource :
	 ['eot']
	 ['https://github.com/RoelN/font-face-render-check/raw/98f0adda9cfe44fe97f6d538aa893a37905a7add/dev/pixelambacht-dash.eot']
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"

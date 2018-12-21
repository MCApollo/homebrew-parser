name :
	 Lib3ds
homepage :
	 https://code.google.com/archive/p/lib3ds/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/lib3ds/lib3ds-1.3.0.zip
description :
	 Library for managing 3D-Studio Release 3 and 4 '.3DS' files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"

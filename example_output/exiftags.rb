name :
	 Exiftags
homepage :
	 https://johnst.org/sw/exiftags/
url :
	 https://johnst.org/sw/exiftags/exiftags-1.01.tar.gz
description :
	 Utility to read EXIF tags from a digital camera JPEG file
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
	 bin.mkpath
	 man1.mkpath
	 system "make", "prefix=#{prefix}", "mandir=#{man}", "install"

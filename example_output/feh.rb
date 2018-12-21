name :
	 Feh
homepage :
	 https://feh.finalrewind.org/
url :
	 https://feh.finalrewind.org/feh-2.28.tar.bz2
description :
	 X11 image viewer
build_deps :
link_deps :
	 imlib2
	 libexif
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "verscmp=0", "exif=1"
	 system "make", "PREFIX=#{prefix}", "install"

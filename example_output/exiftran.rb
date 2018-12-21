name :
	 Exiftran
homepage :
	 https://www.kraxel.org/blog/linux/fbida/
url :
	 https://www.kraxel.org/releases/fbida/fbida-2.14.tar.gz
description :
	 Transform digital camera jpegs and their EXIF data
build_deps :
	 pkg-config
link_deps :
	 jpeg
	 libexif
	 pixman
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/185c281/exiftran/fix-build.diff
EOF_patch :
install :
	 system "make"
	 system "make", "prefix=#{prefix}", "install"

name :
	 ArgyllCms
homepage :
	 https://www.argyllcms.com/
url :
	 https://www.argyllcms.com/Argyll_V2.0.1_src.zip
description :
	 ICC compatible color management system
build_deps :
	 jam
link_deps :
	 jpeg
	 libpng
	 libtiff
conflicts :
	 num-utils
patches :
EOF_patch :
install :
	 if MacOS.version == :el_capitan && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 inreplace "numlib/numsup.c", "CLOCK_MONOTONIC", "UNDEFINED_GIBBERISH"
	 end
	 system "sh", "makeall.sh"
	 system "./makeinstall.sh"
	 rm "bin/License.txt"
	 prefix.install "bin", "ref", "doc"

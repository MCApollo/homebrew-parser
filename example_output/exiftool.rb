name :
	 Exiftool
homepage :
	 https://www.sno.phy.queensu.ca/~phil/exiftool/index.html
url :
	 https://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-11.11.tar.gz
description :
	 Perl lib for reading and writing EXIF metadata
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
	 inreplace "exiftool", "$exeDir/lib", libexec/"lib"
	 system "perl", "Makefile.PL"
	 system "make", "all"
	 libexec.install "lib"
	 bin.install "exiftool"
	 doc.install Dir["html/*"]
	 man1.install "blib/man1/exiftool.1"
	 man3.install Dir["blib/man3/*"]

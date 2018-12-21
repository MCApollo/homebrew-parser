name :
	 Epstool
homepage :
	 http://www.ghostgum.com.au/software/epstool.htm
url :
	 https://src.fedoraproject.org/repo/pkgs/epstool/epstool-3.08.tar.gz/465a57a598dbef411f4ecbfbd7d4c8d7/epstool-3.08.tar.gz
description :
	 Edit preview images and fix bounding boxes in EPS files
build_deps :
link_deps :
	 ghostscript
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install",
	 "EPSTOOL_ROOT=#{prefix}",
	 "EPSTOOL_MANDIR=#{man}",
	 "CC=#{ENV.cc}"

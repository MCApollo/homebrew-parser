name :
	 Ocrad
homepage :
	 https://www.gnu.org/software/ocrad/
url :
	 https://ftp.gnu.org/gnu/ocrad/ocrad-0.26.tar.lz
description :
	 Optical character recognition (OCR) program
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install", "CXXFLAGS=#{ENV.cxxflags}"

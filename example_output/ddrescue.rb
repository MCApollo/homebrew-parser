name :
	 Ddrescue
homepage :
	 https://www.gnu.org/software/ddrescue/ddrescue.html
url :
	 https://ftp.gnu.org/gnu/ddrescue/ddrescue-1.23.tar.lz
description :
	 GNU data recovery tool
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
	 system "./configure", "--prefix=#{prefix}",
	 "CXX=#{ENV.cxx}"
	 system "make", "install"

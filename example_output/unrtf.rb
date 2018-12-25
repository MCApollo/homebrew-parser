name :
	 Unrtf
homepage :
	 https://www.gnu.org/software/unrtf/
url :
	 https://ftp.gnu.org/gnu/unrtf/unrtf-0.21.9.tar.gz
description :
	 RTF to other formats converter
build_deps :
	 autoconf
	 automake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap"
	 system "./configure", "LIBS=-liconv", "--prefix=#{prefix}"
	 system "make", "install"

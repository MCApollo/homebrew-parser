name :
	 Dosfstools
homepage :
	 https://github.com/dosfstools
url :
description :
	 Tools to create, check and label file systems of the FAT family
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-f", "-i"
	 system "./configure", "--prefix=#{prefix}", "--without-udev",
	 "--enable-compat-symlinks"
	 system "make", "install"

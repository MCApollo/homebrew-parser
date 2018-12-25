name :
	 Osslsigncode
homepage :
	 https://sourceforge.net/projects/osslsigncode/
url :
	 https://downloads.sourceforge.net/project/osslsigncode/osslsigncode/osslsigncode-1.7.1.tar.gz
description :
	 Authenticode signing of PE(EXE/SYS/DLL/etc), CAB and MSI files
build_deps :
	 autoconf
	 pkg-config
link_deps :
	 openssl
optional_deps :
	 libgsf
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-ivf" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"

name :
	 Conserver
homepage :
	 https://www.conserver.com/
url :
	 https://github.com/conserver/conserver/releases/download/v8.2.2/conserver-8.2.2.tar.gz
description :
	 Allows multiple users to watch a serial console at the same time
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"

name :
	 AescryptPacketizer
homepage :
	 https://www.aescrypt.com
url :
	 https://www.aescrypt.com/download/v3/linux/aescrypt-3.13.tgz
description :
	 Encrypt and decrypt using 256-bit AES encryption
build_deps :
	 :xcode
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 cd "linux"
	 system "autoreconf", "-ivf"
	 system "./configure", "prefix=#{prefix}", "--enable-iconv",
	 "--disable-gui"
	 system "make", "install"
	 else
	 cd "src" do
	 inreplace "Makefile", "#LIBS=-liconv", "LIBS=-liconv"
	 system "make"
	 bin.install "aescrypt"
	 bin.install "aescrypt_keygen"

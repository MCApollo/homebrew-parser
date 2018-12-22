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
	 end
	 man1.install "man/aescrypt.1"
	 end
	 if build.without? "default-names"
	 mv "#{bin}/aescrypt", "#{bin}/paescrypt"
	 mv "#{bin}/aescrypt_keygen", "#{bin}/paescrypt_keygen"
	 end

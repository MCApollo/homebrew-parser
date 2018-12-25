name :
	 BbftpClient
homepage :
	 https://software.in2p3.fr/bbftp/
url :
	 https://software.in2p3.fr/bbftp/dist/bbftp-client-3.2.1.tar.gz
description :
	 Secure file transfer software, optimized for large files
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append_to_cflags "-DHAVE_NTOHLL" if MacOS.version >= :yosemite
	 cd "bbftpc" do
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}", "--prefix=#{prefix}"
	 system "make", "install"
	 end

name :
	 Libpgm
homepage :
	 https://code.google.com/archive/p/openpgm/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/openpgm/libpgm-5.2.122~dfsg.tar.gz
description :
	 Implements the PGM reliable multicast protocol
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
	 cd "openpgm/pgm" do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 end

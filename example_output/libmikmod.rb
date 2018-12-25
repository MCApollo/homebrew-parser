name :
	 Libmikmod
homepage :
	 https://mikmod.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.11.1/libmikmod-3.3.11.1.tar.gz
description :
	 Portable sound library
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
	 mkdir "macbuild" do
	 system "../configure", "--prefix=#{prefix}", "--disable-alsa",
	 "--disable-sam9407", "--disable-ultra"
	 system "make", "install"
	 end

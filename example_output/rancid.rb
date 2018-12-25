name :
	 Rancid
homepage :
	 https://www.shrubbery.net/rancid/
url :
	 ftp://ftp.shrubbery.net/pub/rancid/rancid-3.7.tar.gz
description :
	 Really Awesome New Cisco confIg Differ
build_deps :
link_deps :
optional_deps :
conflicts :
	 par
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--exec-prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"

name :
	 Paperkey
homepage :
	 https://www.jabberwocky.com/software/paperkey/
url :
	 https://www.jabberwocky.com/software/paperkey/paperkey-1.5.tar.gz
description :
	 Extract just secret information out of OpenPGP secret keys
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['secret.gpg']
	 ['https://gist.github.com/bfontaine/5b0e3efa97e2dc42a970/raw/915e802578339ddde2967de541ed65cb76cd14b9/secret.gpg']
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"

name :
	 Dhcping
homepage :
	 https://www.mavetju.org/unix/general.php
url :
	 https://www.mavetju.org/download/dhcping-1.2.tar.gz
description :
	 Perform a dhcp-request to check whether a dhcp-server is running
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
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"

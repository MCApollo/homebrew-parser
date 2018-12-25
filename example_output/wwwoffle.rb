name :
	 Wwwoffle
homepage :
	 https://www.gedanken.org.uk/software/wwwoffle/
url :
	 https://www.gedanken.org.uk/software/wwwoffle/download/wwwoffle-2.9j.tgz
description :
	 Better browsing for computers with intermittent connections
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
	 system "make", "install"

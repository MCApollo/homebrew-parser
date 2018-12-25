name :
	 Eprover
homepage :
	 https://eprover.org/
url :
	 https://wwwlehre.dhbw-stuttgart.de/~sschulz/WORK/E_DOWNLOAD/V_2.2/E.tgz
description :
	 Theorem prover for full first-order logic with equality
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
	 system "./configure", "--prefix=#{prefix}",
	 "--man-prefix=#{man1}"
	 system "make"
	 system "make", "install"

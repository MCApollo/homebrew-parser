name :
	 Xvid
homepage :
	 https://labs.xvid.com/
url :
	 https://downloads.xvid.com/downloads/xvidcore-1.3.5.tar.bz2
description :
	 High-performance, high-quality MPEG-4 video library
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
	 cd "build/generic" do
	 system "./configure", "--disable-assembly", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 end

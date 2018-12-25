name :
	 Libde265
homepage :
	 https://github.com/strukturag/libde265
url :
	 https://github.com/strukturag/libde265/releases/download/v1.0.3/libde265-1.0.3.tar.gz
description :
	 Open h.265 video codec implementation
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
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--disable-sherlock265",
	 "--disable-dec265",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 (libexec/"bin").install bin/"acceleration_speed",
	 bin/"block-rate-estim",
	 bin/"tests"

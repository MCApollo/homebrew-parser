name :
	 Norm
homepage :
	 https://www.nrl.navy.mil/itd/ncs/products/norm
url :
	 https://downloads.pf.itd.nrl.navy.mil/norm/archive/src-norm-1.5r6.tgz
description :
	 NACK-Oriented Reliable Multicast
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
	 system "./waf", "configure", "--prefix=#{prefix}"
	 system "./waf", "install"
	 include.install "include/normApi.h"

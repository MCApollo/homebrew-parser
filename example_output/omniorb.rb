name :
	 Omniorb
homepage :
	 https://omniorb.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-4.2.2/omniORB-4.2.2.tar.bz2
description :
	 IOR and naming service utilities for omniORB
build_deps :
	 pkg-config
link_deps :
optional_deps :
conflicts :
resource :
	 ['bindings']
	 ['https://downloads.sourceforge.net/project/omniorb/omniORBpy/omniORBpy-4.2.2/omniORBpy-4.2.2.tar.bz2']
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 resource("bindings").stage do
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 end

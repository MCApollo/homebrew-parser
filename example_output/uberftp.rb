name :
	 Uberftp
homepage :
	 https://github.com/JasonAlt/UberFTP
url :
	 https://github.com/JasonAlt/UberFTP/archive/Version_2_8.tar.gz
description :
	 Interactive GridFTP client
build_deps :
link_deps :
	 globus-toolkit
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 globus = Formula["globus-toolkit"].opt_prefix
	 inreplace "configure", "globus_location/include/globus/gcc64dbg", "globus_location/libexec/include"
	 inreplace "configure", "globus_location/lib64", "globus_location/libexec/lib"
	 system "./configure", "--prefix=#{prefix}",
	 "--with-globus=#{globus}"
	 system "make"
	 system "make", "install"

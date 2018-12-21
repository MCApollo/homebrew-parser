name :
	 Colortail
homepage :
	 https://github.com/joakim666/colortail
url :
	 https://github.com/joakim666/colortail.git
description :
	 Like tail(1), but with various colors for specified output
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
	 https://github.com/joakim666/colortail/commit/36dd0437bb364fd1493934bdb618cc102a29d0a5.diff?full_index=1
EOF_patch :
install :
	 system "./autogen.sh", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
